import Joi from 'joi';

const loginUserSchema = Joi.object({
  username: Joi.string()
    .email({ tlds: false })
    .regex(/^[^@]+@(mail\.ugm\.ac\.id|ugm\.ac\.id)$/)
    .required()
    .messages({
      'string.base': 'Email harus berupa karakter.',
      'string.email': 'Email harus dalam format yang valid.',
      'string.pattern.base': 'Email hanya diperbolehkan dengan domain @mail.ugm.ac.id atau @ugm.ac.id.',
      'any.required': 'Email wajib diisi.',
    }),
  password: Joi.string()
    .min(4)
    .max(16)
    .required()
    .messages({
      'string.base': 'Passcode harus berupa teks.',
      'string.min': 'Passcode harus memiliki panjang minimal 4 karakter.',
      'string.max': 'Passcode tidak boleh lebih dari 16 karakter.',
      'any.required': 'Passcode wajib diisi.',
    }),
});

export default loginUserSchema;
