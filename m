Return-Path: <ksummit+bounces-2912-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDBpNOlfEGobWwYAu9opvQ
	(envelope-from <ksummit+bounces-2912-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 22 May 2026 15:53:45 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBF5B592C
	for <lists@lfdr.de>; Fri, 22 May 2026 15:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA8403066339
	for <lists@lfdr.de>; Fri, 22 May 2026 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF2E3A1A5B;
	Fri, 22 May 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uuz3llCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYCNX46z"
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE5221277
	for <ksummit@lists.linux.dev>; Fri, 22 May 2026 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456374; cv=pass; b=HHRWCjPWVehFlpJTeAM0PKiaU7C9Zs+OeYA9preGDLATEYQa5V1DeiFFPd9HePzOr9snY2Ghl3dHx3yT907QGdzSqlreA4PMsXcooUuhU9FXzH9lQEQttEuxn+QqlwDcfUc+ZqUjDGmrGNnNppw2DscmZ1+TuboBk4jMgoU7SRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456374; c=relaxed/simple;
	bh=cR01YuBOJBFa2Nl2N3gGgI7rO0zjnLePzS8uS/KB6uM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D7PERlAfu8hMD0GOHKUXC1DRyV1HbFioEN0ZBzqHrKLUsXlwLEkmAfeXfZHquJIv9l2XMEH1tgLTBjtzXkR4+8exAAyT6t6XTrOAUUxOjts8UpMmTftDU97jQ7mCHywc0CxTRViTjE5tHx37mQRz0KO/Q3OVJ/HolIeelcLiX3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uuz3llCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYCNX46z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBWwdA776908
	for <ksummit@lists.linux.dev>; Fri, 22 May 2026 13:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4c1ALum3p81Zd2+7v5NX0tsU/qlUTXoR2hTFDR6MsYI=; b=Uu
	z3llClaPqieageyhcM2HF5gbjwUJRFfo32s3cXTTH2H32rpIMfQU2P3QIJcKpQBn
	5T5CI3X6DE3Nt2YW/craA5W3SmSdSoDPQPn7f7Nn7neZsAxz+cW7Ldq0phCOlqlU
	CJIrd2Wus8hOxon0smeSfeDMbNooaY7BEAEoeYHOvMsm15hbvJBccu9Bo0vvVZsT
	94jVbvwdH6kHPxXDwW5N7hV8KqpQmkDsV1XkGYIOOjaUanVB8477zyIcOF6o5u75
	diJ4XSrtnwNZcDkKalYhN3lFS0uKUnvJAx8v+0kPkTpBxjYACu+nYRGRzbFhzzDc
	i2g86OS1lZtF2AZGw8VQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h3n3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ksummit@lists.linux.dev>; Fri, 22 May 2026 13:26:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba115ab6bbso77662105ad.3
        for <ksummit@lists.linux.dev>; Fri, 22 May 2026 06:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779456370; cv=none;
        d=google.com; s=arc-20240605;
        b=AgnmMdwBUZEQ5rq5QK8Sb4gLtf9iJQxh1+bCjR53uCQUHlQM0PJ9kgvTrSDq4uOG4B
         nRZDH4iO84NOApZa7S9pqcgRv+VTLAg9ymQ7iIhvHTGAMCDHEpj6dZ7QcZqrT9tycg55
         GH+FKAq95+wvdHzCMEiz4bTlsmGzmu8mxjeYoK8tGctjPc/6dLUkCuX7od4/IFxZP8Es
         jMCl/G9cf8IqhFj8oeM2kg+iweMbzu6zCVauPalErEP1ZfwE7nVECbw3B+XoFoq6LOlO
         p4PO4dfRbKB4ULRDBHROQQGVpYYL82937hlfnDW7dp7WR6TOZ5bhf4JVmHU/dA2JQweK
         Shtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4c1ALum3p81Zd2+7v5NX0tsU/qlUTXoR2hTFDR6MsYI=;
        fh=RDYH4N7g1pqMAfK0OKc976h8l5gV9Lcgjtv3LohqGog=;
        b=IgV0NEonTpp6SDjJYWmnyj68Ppr4OQNjKmfAPTxl7efg6KTL/1vbjSHdJ+8otG/Xmh
         UWbAOkL7bb0cjDuFen88anN+Xaz6jrXpj7NuGHJSauPRd4D+baaNk0ME6Acj+IiDnkN1
         R+C2+XWk8EeGS77qaSPkGyILOpRV4KaKbY5cpiEH0D74kqVIwdjcSVIKyvM7uvzlqCtG
         5wKOq33ZXZOMBeVb8nYmoGcmpv5PUR67Tfr60CXmBP6fJ70LWK0OLZSBlLthlcxxQtcK
         74WSH5q4C6EfW3mvh0bK14VCw4o6GidrakLNtTw6u6US+ddKrUDreti/ktCXoFuTwHK1
         2zQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456370; x=1780061170; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4c1ALum3p81Zd2+7v5NX0tsU/qlUTXoR2hTFDR6MsYI=;
        b=PYCNX46zBxUOnBdy/fQczzsrVVE8jeRwW1N9VtYA3AabEYk+KfFtRz83f91NJcFFEK
         VRwO7XcD40U1cJ4sB4BV5v8KX6W3Jz5gfWya68UqDiYwANbwt+l9kIfeUnpNInGpEmi0
         PCyUbIONka4giDpl21dMYMfAP+/o+8UZM/Vp0inHxNh0Nlw5ZhUoTyM7Afk0HeNzwU1y
         63AkR6HyQ7s1ZOflnxCc1vVKH8tbkcee2JkJBc7iMdyMNipHgKvnIKcCW/epGLdEHSBh
         cLifjpkY0UhLqqemV6DoytAnDXiE39rvqi5d6Qw4DOcr4tJS9Do+8SeqRl2lpRSkmPTK
         wi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456370; x=1780061170;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4c1ALum3p81Zd2+7v5NX0tsU/qlUTXoR2hTFDR6MsYI=;
        b=X1njQNSZGRDbLBJn2cE83F80gM+WG15RXGH8gsDebXgG8SzMJSYANqVe4PiPkxuWQT
         SgQZiKzPLQ0R54xvPDtPx6rBqLIpjoIgGRw09U2CqOBNYeCSH9CNs0L99h1QdIXt4eh4
         /MPTXPSy07d5fKTjYJDOJh7Pe8in0x9Nr8L7DkuHzPEUK7WNOUwXHVzFsdkSR+bc43Mx
         YPHaWaSVHMXRmXhER+NhijlwrnV1EPr1UeIZXqUC0a2Ml4WnUleoHIi2pMVk4NTUnH61
         wsqqWO7C65sloaQu/oxNdJ3kR7lUayZwUvM1FuDPRafavv9r1aRY7Gy+QS9FoDloF6vg
         HoRg==
X-Gm-Message-State: AOJu0YxPEeDnksDOFuqvWH6qJfoUiam+iEfTvCmrkjX01iHK6ZLY4lTG
	VJbXQ9VJSegTcfVGI2SHqQxx+qJQ9PH1Dcoqd2V3D+RTZ4c7TiYnaHQWGAOLDg3MFgB4dFqpEjC
	Kx+gmT68X1QpgoGzKy1WME1oMQlUJTo93jG6UywF8AealtNhOHEQ/MZ4Ubv+YieP8N/De05eB3f
	pphBGqAKeve+HnFBRqvQodUxWlRMA6EHytC28AjWUoTys=
X-Gm-Gg: Acq92OG+VV0IAKGtwWLlI/QT+VUlUPGq5GIYUKHpbJkxSha4gzlpkv2fFkUfqxpVEta
	GJTP4BS2KcOJWglU2vBQjwXra5coG9Yaf2NZA9DnwlVJTJzf+4cIESgG5hFbzwfzkDXsT0aA7wM
	mtbFPaUDyYSJM1VnjKqHRxChMELsClCfbh0fGw7LaZqFFnPvpx1WqO6ibeohZZYLGa3lGeOW4Uo
	T6hlQ==
X-Received: by 2002:a05:6a21:600f:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3b329152a47mr3664856637.12.1779456370474;
        Fri, 22 May 2026 06:26:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:600f:b0:35d:5d40:6d79 with SMTP id
 adf61e73a8af0-3b329152a47mr3664818637.12.1779456369982; Fri, 22 May 2026
 06:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:25:57 +0300
X-Gm-Features: AVHnY4JiwhliqENIAvaaHtqgo9OQ3UWRZE_Y1Yd9o_4g-QQr7gFQNonr1J0WLlM
Message-ID: <CAO9ioeVKp9_WpNO8UrFMh=9nMz1yMCOe1FVXnD078sbg4FRrQQ@mail.gmail.com>
Subject: [TECH TOPIC] DRM: handling runtime requirements for device components.
To: ksummit@lists.linux.dev
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: y9ZOvqumN6upukc3i0lsS10NniQP76Bg
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a105973 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=iGdi3G1Nflt79jdLyawA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: y9ZOvqumN6upukc3i0lsS10NniQP76Bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMiBTYWx0ZWRfX3pR3NgktJowC
 8z+4vLTB6VQhSEZnsF0A26bGLmRktDMntEiL4GCMek18RTR5gmQqtCTILta/3nEKtsW7dyteyku
 HeADk3iHyQIR7Fj9E+v9IxGZJ4y5l/O+q/uEA0n4ddG019vEKmTQqilqSRk4UYeCJDZhfFHkXNN
 Apj3HsFsQwaAmWhiqQwKjBvGYR+jUFXCk84vW1xyls9mYKs+IvgDYkvY3ypR4YcmqBLjugxeRex
 Fdwp5i4rwIRdxNXDUFIIWlQ33MKOcDCfbdeNRdge9YRbKm4t1IPNgMxMzkEaNTf4FdCqUohFy8r
 DeQLUsqfey95cCa51McL7ddzuTqpA1pnznHZfKbmtFNDk7k66RRc7mX3LcqAj/Ul/CGoQUttYGd
 IN5ueO0qbaZP/x6ocTdO3k+7g+aBZVPBhyHku1XzHhpxcVCrWATViaK61cQKNiEplz1tsAAMCSI
 cyju4yyBZ+0vI96hYDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,ksummit@lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_FROM(0.00)[bounces-2912-lists=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 68FBF5B592C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

As we don't have a separate Graphis MC this year, I've submitted the
talk to the KTS trail.

In the DRM subsystem the callbacks setting up the display pipeline are
not supposed to fail. This is not the problem for the desktop GPUs,
but embedded display devices, containing multiple components with
varying runtime requirements, often have to call fallible setup
functions (clk_prepare_enable(), pm_runtime_resume_and_get(),
phy_init() / phy_power_on(), etc.)  in those callbacks. This
frequently results in the clumsy and error prone code, tracking at
which step the enablement functions have failed in order to prevent
unblocked register access and to handle disablement correctly in the
atomic_disable() paths.

The goal of the talk is to trigger the discussion on possible ways of
handling these runtime requirements, while not breaking the existing
DRM API contract.

-- 
With best wishes
Dmitry

