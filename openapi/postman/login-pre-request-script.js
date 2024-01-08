const loginUrl = pm.environment.get("requestUrl");
const userEmail = pm.environment.get("userEmail");
const userPassword = pm.environment.get("userPassword");

const requestOptions = {
    method: 'POST',
    header: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8'
    },
    body: {
        mode: 'raw',
        raw: JSON.stringify({
            email: userEmail,
            password: userPassword
        })
    }
};

pm.sendRequest(loginUrl, requestOptions, (err, res) => {
    if (err) {
        console.error("Error during login:", err);
    } else {
        const responseBody = res.json();
        console.log("Login response:", responseBody);
        pm.environment.set("bearerToken", responseBody.token);
    }
});
