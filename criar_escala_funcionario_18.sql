-- 1. Primeiro, descobrir o company_id (você pode comentar essa linha se já sabe o seu)
-- SELECT id FROM companies;

-- 2. Criar a escala semanal para funcionário 18 (seg a dom 07:00-16:20)
-- COMO USAR: Substitua 'COLOQUE_SEU_COMPANY_ID_AQUI' pelo seu company_id real na linha abaixo!
WITH nova_escala AS (
    INSERT INTO work_shifts (id, company_id, name, description, type, schedule_json, created_at, updated_at)
    VALUES (
        gen_random_uuid(),
        'COLOQUE_SEU_COMPANY_ID_AQUI',  -- <<-- ALTERE ESTA LINHA!
        'Seg-Dom 07:00-16:20 (2h almoço)',
        'Escala para funcionário 18: seg a dom das 07:00 às 16:20 com intervalo de 12:00-14:00',
        'weekly',
        jsonb_build_object(
            '0', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '1', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '2', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '3', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '4', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '5', jsonb_build_object('start', '07:00', 'end', '16:20'),
            '6', jsonb_build_object('start', '07:00', 'end', '16:20')
        ),
        NOW(),
        NOW()
    )
    RETURNING id
)

-- 3. Vincular automaticamente a escala ao funcionário 18 (mesmo company_id)
UPDATE employees
SET work_shift_id = (SELECT id FROM nova_escala)
WHERE code = '18' 
  AND company_id = 'COLOQUE_SEU_COMPANY_ID_AQUI';  -- <<-- ALTERE ESTA LINHA TAMBÉM!
