Snad jsem způsob toho, jak to máme provést, pochopil správně...

Výpis 1 - učitelé bez předmětu 
SELECT Teacher.id, Teacher.name
FROM Teacher LEFT JOIN ClassSubject ON Teacher.id=ClassSubject.teacher_id
WHERE ClassSubject.teacher_id IS NULL;

Výpis 2 - pětky
SELECT p.name, COUNT(*) FROM Pupil p
JOIN PupilSubject ps ON p.id = ps.pupil_id
WHERE ps.grade = 5
GROUP BY p.name;

Výpis 3 - průměr v každé třídě
SELECT c.year, c.name, AVG(ps.grade) FROM Pupil p
JOIN PupilSubject ps ON p.id = ps.pupil_id
JOIN Class c ON c.id = p.class_id
GROUP BY c.year, c.name

Výpis 4 - průměr v ročníku
SELECT c.year, AVG(ps.grade) FROM Pupil p
JOIN PupilSubject ps ON p.id = ps.pupil_id
JOIN Class c ON c.id = p.class_id
GROUP BY c.year

Výpis 5 - výpis učitele s jedním předmětem ve své třídě
SELECT t.name, count(cs.subject_id) 
FROM Teacher t JOIN Class c ON t.id = c.homeroom_teacher_id
JOIN ClassSubject cs ON c.homeroom_teacher_id = cs.teacher_id
GROUP BY t.name
HAVING count(cs.subject_id) = 1

Výpis 6 - výpis průměru pro předmět a třídu
SELECT s.name, c.year, c.name, AVG(ps.grade) FROM
PupilSubject ps
JOIN Pupil p ON ps.pupil_id = p.id
JOIN Class c ON p.class_id = c.id
JOIN Subject s ON ps.subject_id = s.id
GROUP BY s.name, c.year, c.name
ORDER BY s.name, c.year, c.name ASC

Výpis 7 - hitparáda
SELECT t.name, AVG(ps.grade) FROM Teacher t
JOIN ClassSubject cs ON t.id = cs.teacher_id
JOIN Pupil p ON p.class_id = cs.class_id
JOIN PupilSubject ps ON ps.pupil_id = p.id
GROUP BY t.name
ORDER BY AVG(ps.grade) ASC;
-- počet řádků omezen na 5

SELECT t.name, AVG(ps.grade) FROM Teacher t
JOIN ClassSubject cs ON t.id = cs.teacher_id
JOIN Pupil p ON p.class_id = cs.class_id
JOIN PupilSubject ps ON ps.pupil_id = p.id
GROUP BY t.name
ORDER BY AVG(ps.grade) DESC;
-- počet řádků omezen na 5