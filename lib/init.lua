-- python-resource-postgresql-library main module.
-- Renders the persistence package (SQLAlchemy async engine, Alembic migrations, base model).
--
-- The calling archetype is responsible for adding the corresponding
-- dependencies to pyproject.toml:
--   sqlalchemy[asyncio], asyncpg, alembic
--
-- API:
--   local pg = require("python-resource-postgresql")
--   pg.render(context, { destination = context:get("project-name") })
--
-- Context contract:
--   prefix-name  — kebab-case first segment (e.g. "billing")
--   suffix-name  — kebab-case second segment (e.g. "service")
--   prefix_name  — snake_case first segment (e.g. "billing")
--   suffix_name  — snake_case second segment (e.g. "service")
--   PrefixName   — PascalCase first segment (e.g. "Billing")

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
