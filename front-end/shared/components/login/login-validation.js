import { string, object } from 'yup';

const schema = object({
  email: string().email().required(),
  password: string().required(),
}).required();

export default schema;
