import { createThirdwebClient } from "thirdweb";

// Replace this with your client ID string
// refer to https://portal.thirdweb.com/typescript/v5/client on how to get a client ID
const clientId = "0xdeD59c11C36Da669C1C0f608b5185fBb03c591D8";

export const client = createThirdwebClient({
  clientId: clientId,
});
