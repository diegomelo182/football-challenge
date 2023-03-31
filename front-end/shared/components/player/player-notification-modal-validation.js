import { string, object } from 'yup';

const schema = object({
  message: string().required(),
}).required();

export default schema;
