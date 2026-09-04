
-- Atualizar escala da funcionaria EVELIN LUIZA FERREIRA DA SILVA (matricula/code: 38)
-- Escala 12x36 Diurno (07:00 as 19:00, dia sim dia nao)
-- OBS 1: o campo id da tabela employees eh UUID, entao NAO use id = '38'
-- OBS 2: a tabela employees NAO possui coluna updated_at

UPDATE public.employees
SET shift_type = '12x36'
WHERE code = '38';

-- Para confirmar a atualizacao:
-- SELECT id, name, code, shift_type
-- FROM public.employees
-- WHERE code = '38';
