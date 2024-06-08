const loginUrl = pm.environment.get("requestUrl");
const userEmail = pm.environment.get("userEmail");
const userPassword = pm.environment.get("userPassword");

const requestOptions = {
    url: loginUrl,
    method: 'POST',
    header: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8'
    },
    body: {
        mode: 'raw',
        raw: JSON.stringify({
            'email': userEmail,
            'password': userPassword
        })
    }
};

pm.sendRequest(requestOptions, function (err, res) {
    if (err) {
        console.error("Error during login:", err);
    } else {
        const data = res.json();
        if (data && data.response.token) {
            pm.environment.set("bearerToken", data.response.token);
        } else {
            console.log("Login response:", data);
            console.error("Token not found in response");
        }
    }
});
