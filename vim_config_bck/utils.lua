local utils = {}

function utils.concat_tables(t1, t2)
  if t1 == nil and t2 == nil then
    return {}
  end
  if t1 == nil then
    return t2
  end
  if t2 == nil then
    return t1
  end
  for i=1,#t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

function utils.goto_next(severity)
  return function (opts)
    return severity == nil
      and vim.diagnostic.goto_next(opts)
      or vim.diagnostic.goto_next(utils.concat_tables({severity = severity}, opts))
  end
end

function utils.goto_prev(severity)
  return function (opts)
    return severity == nil
      and vim.diagnostic.goto_prev(opts)
      or vim.diagnostic.goto_prev(utils.concat_tables({severity = severity}, opts))
  end
end

return utils
