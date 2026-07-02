-- 1. Primeiro, descobrir o company_id do usuário logado
--    (você pode substituir o SELECT abaixo por seu company_id real se souber)
-- Exemplo de como encontrar:
-- SELECT id FROM companies WHERE name = 'SuaEmpresa';

-- 2. Criar a escala semanal para funcionario 18 (seg a dom 07:00-16:20
-- Primeiro, inserir a escala (substitua SEU_COMPANY_ID_AQUI pelo company_id correto
INSERT INTO work_shifts (id, company_id, name, description, type, schedule_json, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'SEU_COMPANY_ID_AQUI',
    'Seg-Dom 07:00-16:20 (2h almoço)',
    'Escala para funcionário 18: seg a dom das 07:00 as 16:20 com intervalo de 12:00-14:00',
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
);

-- 3. Vincular a escala ao funcionário 18 (substitua 18 pelo código do funcionário e SEU_COMPANY_ID_AQUI pelo company_id)
-- Primeiro, pegue o id do funcionário pelo código
-- SELECT id FROM employees WHERE code = '18' AND company_id = 'SEU_COMPANY_ID_AQUI';

-- Depois, atualize o work_shift_id do funcionário
UPDATE employees
SET work_shift_id = (SELECT id FROM work_shifts WHERE name = 'Seg-Dom 07:00-16:20 (2h almoço')
WHERE code = '18' AND company_id = 'SEU_COMPANY_ID_AQUI';
