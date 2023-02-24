--medfacility_queries.sql


--author name: Peter Wotherspoon Bustamante


/* 

Practicing some more advanced queries, that are being applied to a
mock medical facility relational database. Various types of joins between 
multiple tables (made in in careful order), are included in these queries.

*/




--Query 1:
SELECT doctor_title, doctor_fname, doctor_lname, doctor_phone
FROM ((CGH.DOCTOR d JOIN CGH.DOCTOR_SPECIALITY ds ON d.doctor_id = ds.doctor_id)
    JOIN CGH.SPECIALITY s ON ds.spec_code = s.spec_code)
WHERE upper(s.spec_description) = 'ORTHOPEDIC SURGERY'
ORDER BY doctor_lname, doctor_fname;




--Query 2:
SELECT item_code, item_description, item_stock, cc_title
FROM CGH.ITEM I JOIN CGH.COSTCENTRE C ON i.cc_code = c.cc_code
WHERE lower(i.item_description) LIKE '%disposable%'
ORDER BY item_code;




--Query 3:
SELECT p.patient_id, ltrim(p.patient_fname || ' ' || p.patient_lname) AS "Patient Name", 
    to_char(adm_date_time, 'dd-Mon-yyyy hh:mi:ss PM') AS "Admission Date And Time",
    d.doctor_title || ' ' || ltrim(d.doctor_fname || ' ' || d.doctor_lname) AS "Doctor Name"
FROM ((CGH.PATIENT p JOIN CGH.ADMISSION a ON p.patient_id = a.patient_id) 
    JOIN CGH.DOCTOR d ON d.doctor_id = a.doctor_id)
WHERE adm_date_time >= to_date('11-Sep-2021 10:00:00 AM', 'dd-Mon-yyyy hh:mi:ss PM') AND
    adm_date_time <= to_date('14-Sep-2021 6:00:00 PM', 'dd-Mon-yyyy hh:mi:ss PM')
ORDER BY a.adm_date_time;





--Query 4:
SELECT p.proc_code, p.proc_name, p.proc_description, 
    to_char(p.proc_std_cost, '$9,999.99') AS "Procedure Standard Cost"
FROM CGH.PROCEDURE p JOIN CGH.ADM_PRC a ON p.proc_code = a.proc_code
WHERE (a.adprc_pat_cost + a.adprc_items_cost) < p.proc_std_cost
ORDER BY p.proc_std_cost DESC;




*/

Regarding Query 5:
I ordered date of birth, by OLDEST first, 
(since oldest are generally most vulnerable), 
that way the client can see highest admissions, 
AND OLDEST, first (so, most vulnerable patients).

/*

--Query 5:
SELECT p.patient_id, p.patient_lname, p.patient_fname, 
    to_char(p.patient_dob, 'dd-Mon-yyyy') AS "Patient DOB", 
    count(*) AS "Number Of Admissions"
FROM CGH.ADMISSION a JOIN CGH.PATIENT p ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_lname, p.patient_fname, p.patient_dob
HAVING count(*) > 2
ORDER BY count(*) DESC, p.patient_dob;



--Query 6:
SELECT a.adm_no, a.patient_id, p.patient_fname, p.patient_lname, 
    floor(a.adm_discharge - a.adm_date_time) || ' days ' || 
    to_char(round((((a.adm_discharge - a.adm_date_time) - floor(a.adm_discharge - a.adm_date_time))*24), 1), 99.9) || ' hours'
    AS "Admission Length"
FROM CGH.ADMISSION a JOIN CGH.PATIENT p ON a.patient_id = p.patient_id
WHERE a.adm_discharge IS NOT NULL and (a.adm_discharge - a.adm_date_time) > 
    (SELECT avg(a.adm_discharge - a.adm_date_time) from CGH.ADMISSION a)
ORDER BY a.adm_no;




--Query 7:
SELECT p.proc_code, p.proc_name, p.proc_description, p.proc_time, 
    to_char(p.proc_std_cost, '$9,999.99') AS "Procedure Standard Cost",  
    to_char(avg(a.adprc_pat_cost) - p.proc_std_cost, '$9,999.99') AS "Procedure Price Differential"
FROM CGH.ADM_PRC a JOIN CGH.PROCEDURE p ON a.proc_code = p.proc_code
GROUP BY p.proc_code, p.proc_name, p.proc_std_cost, p.proc_description, p.proc_time
ORDER BY p.proc_code;





--Query 8: 
SELECT p.proc_code, p.proc_name, NVL(i.item_code, '---') AS "Item Code", 
    NVL(i.item_description,'---') AS "Item Description", 
    NVL(to_char(itrt.it_qty_used), '---') AS "Qty Used"
FROM (((CGH.PROCEDURE p)
    LEFT JOIN (CGH.ADM_PRC a) ON p.proc_code = a.proc_code)
    LEFT JOIN (CGH.ITEM_TREATMENT itrt) ON a.adprc_no = itrt.adprc_no)
    LEFT JOIN (CGH.ITEM i) ON itrt.item_code = i.item_code
GROUP BY p.proc_code, p.proc_name, i.item_code, i.item_description, itrt.it_qty_used
ORDER BY p.proc_name, i.item_code;

