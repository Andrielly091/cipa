import api from "../services";

export const getAll = async () => api('GET', 'pessoas')
  .then(({ data }) => data);

export const getForOne = async (id) => api('GET', `pessoas/${id}`)
  .then(({ data }) => data);

export const add = async (description) => await api('POST', 'pessoas/', description)
  .then(({ data }) => data)
  .catch(({ response }) => response.data)

export const rm = async (id) => api('DELETE', `pessoas/${id}`)
  .then(getForOne);

export const put = async (description) => api('PUT', `pessoas/`, description)
  .then(getAll);

export const findByEmail = async (email) => api('GET',`pessoas/findEmail/${email}`)
  .then(({ data }) => data)
  .catch(({ response }) => response.data)