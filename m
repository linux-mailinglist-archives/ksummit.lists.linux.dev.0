Return-Path: <ksummit+bounces-2675-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C69CC51AC
	for <lists@lfdr.de>; Tue, 16 Dec 2025 21:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC25303EF5A
	for <lists@lfdr.de>; Tue, 16 Dec 2025 20:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC73273D66;
	Tue, 16 Dec 2025 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCjhbWi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQSSVLAd"
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CCD20E03F
	for <ksummit@lists.linux.dev>; Tue, 16 Dec 2025 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765917203; cv=none; b=iIM53BdbdK/bVoavOPOzQVDHuBerRqUO+5asThyryV3JMfEwhGztiJUFstv8crjwOsIa3DNdqIIlRR3bOHb2BYsToZ5dFtLKj+vXxY4ENsu83G5kQH8mJyNaZ7hZy1YVh+JkcO1G+xSq4OFPdPwSVUDFPkgkEUbhhiQ2DckB6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765917203; c=relaxed/simple;
	bh=1wxnEvT86GVjZAncq/LU+ZrohmsQer/GMobuV47OClU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mk1wZ9NLSXmeXh0muUd7w5+og3XVETpjiH/ZiQvGxcMhRvI7zt8bMaKe1mi0tnp0Omm77pEiJGoM4MMlgEZ0AIJMK4DgN1MHY7kQPCmERWp86ahkC2A/JJiGbT5k2HS+6JNpHLYBndDzzWaj6wdeLZtok7vSQzT2cruLA2WHxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCjhbWi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQSSVLAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGHFjnF071863
	for <ksummit@lists.linux.dev>; Tue, 16 Dec 2025 20:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23jBGaRZRkT8xRaOIvbXYS28zrBGG+cPpuyh1najSDE=; b=CCjhbWi8Tc13EhaP
	hYtGm1+qORegmGhQTRWQp9eLMZAascbzOXfh8o2E/GF5k9ZNEgLFSZUrWUdVSFli
	fmPOf76Z1NeHcqnonXzDxMHRMOQlG686w8gJ1H9IZ06BOIVzgxMdz7k+/Z5K13AW
	if/hqCcgGAZjWpwgFCkZV033b42MkD5LLclRgHBc8Vq25d8xnHICYgevV6Tkdq+S
	qyY7TKSvQPjAeJx8rd+MXADkAcpEBqmMhoR6BOGOTYwF6wdcqdIBfUiE8HS2dr/I
	gARMx7sSKjYUjN7dudgng57yzZ1Gwuvh56LuxfZ5rFVg1ndChLlkY6mHeUD4prIV
	CUQOIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3bnygk3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ksummit@lists.linux.dev>; Tue, 16 Dec 2025 20:33:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso14836386a91.1
        for <ksummit@lists.linux.dev>; Tue, 16 Dec 2025 12:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765917199; x=1766521999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23jBGaRZRkT8xRaOIvbXYS28zrBGG+cPpuyh1najSDE=;
        b=GQSSVLAdW7xTZ9YlHHmM2UvlvtqCPue3nyLusLFMPO2KIycrkWZyVokG6wqDPaAgbK
         80phzPCNIqlNJ8s7MPDjh2QYnvn+VFV/zi/5gLWk3e6nFPs3pq41XAMlzMtn/RnGqYDW
         OXkTQuv9YM3fE2gzWum098I47qwoLHlcHC4NqWLZCmmSvSdus5g4EEefzdy2AmL+ec63
         oovawgZBc9BaLRk/WJWoe/y1jd01RZ0xXN9TeNaCnT5cn64LHwDJ+wO6FCPdyeYOCMLs
         Rw6VtXsTDWh3c+UgYk0mDQSLm1+XqjcTFBlvzS5vOUFwJANW3Bx3kux85kcbkJGw/B2b
         nOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765917199; x=1766521999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23jBGaRZRkT8xRaOIvbXYS28zrBGG+cPpuyh1najSDE=;
        b=Mzaepx0Cq0Mc+5AxOo6bOZ5S186J4QoBvUpC1QYQXB/XSXzyMWZSF47YiLtuz4tPJF
         7MSZ0j0feypYkwXoxi+pfWnpzIc0PVW+qIiTIE6zkhQwFNCsXvZI6CBxVDwWA7wX7CIj
         ix2ZeBBkgrl+up88c8k8Zk8Nq1XWQcY59tjzxl4qlO7kkVSGpN/FTXrrHY3oYzs4vL0M
         Tua7U4VE4R1b3X5dJbA7t8GGcRhH/b8wRKfuVl3tqJtwL/k7dyWumGcuSEwOe5g/cMFa
         xKjyXXFYsdTxer2AvnjLrZM/Or1tNNz83Za6BEAeiBA9H/ZBHyRU7KK0hrgzVb312Gxz
         YtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUByU0TaUloen4jsL6czqW1HnPmrAsI6wAEcmGhtEUFBSzVAVDd0bORv+DvKm8yCRyW2JK0PxI6@lists.linux.dev
X-Gm-Message-State: AOJu0YyV5xPD5hO4uOptZ18pxAlvBFwU7GrstMPYJvAOGHK7cVfdMJn1
	RgsBR8Q+AZr5W1L+F5VBuiTN+AbIPnhlwj/BMyrd5eKCPbRod1PJyasZMuKFdPq8Q5flQ/Ojq80
	dwJGyRbiqJfdGLO+o8i9ZuQdHEEzHErhcGjqI4fjpMPaSwAoOtJrROaFJUzoZ
X-Gm-Gg: AY/fxX4SyPed3rSl7NgLPaFN3ep1Ht5KvgewU09DS3ezQ7uXmmpytvdMf4uB5j81H/8
	dEOmj+aI6dpRH2fu7EINuVWIP52DByLGXC1iNfkHc6yhZN3aW1uFVZ/+c0w49QNdEX5x8o3IxSE
	gPn2ZsO92kEQoTnLJuMb7UwRmz/MRugk+3IrSboCVjaG1LSoYHV/0rgiDXFSE4aSqccgIYyhgBu
	D9q82C95hNgdN4BaWHKllTsEOseq8YV4nT4qFwKa80OxIxm1Ry0+BCXQ2gxXRR6iuEtiMDmLM2B
	EHHG2EiHmGG2yP6mDXQg0GsXNHP5/v/gMyYrV1RXqKDHwH35VYEV+Ote1cIMUEUPtZIUBApVGT/
	9gU5t1UkCfq54arTmuFKDhqwz44BeQYVxBrwDKezKKsjKGpqbg4b08RYLAQWHZAu2/B+MCA==
X-Received: by 2002:a05:7022:1581:b0:119:e56b:c74d with SMTP id a92af1059eb24-11f34bc7f27mr14747412c88.18.1765917199008;
        Tue, 16 Dec 2025 12:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERKzf++hylghj6f1WOUa/lqRtf6NHvFMJ93EHVff7ol/S5O4Db5yTmzfwbWrHN/P4YV/3/BQ==
X-Received: by 2002:a05:7022:1581:b0:119:e56b:c74d with SMTP id a92af1059eb24-11f34bc7f27mr14747374c88.18.1765917198310;
        Tue, 16 Dec 2025 12:33:18 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm38939382c88.7.2025.12.16.12.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 12:33:17 -0800 (PST)
Message-ID: <2ffa25e5-ef7c-4285-925c-3f698089bf28@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 12:33:16 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel.org tooling update
To: Lukas Wunner <lukas@wunner.de>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <aUGHHFWe_CFuOnRJ@wunner.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aUGHHFWe_CFuOnRJ@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE3MyBTYWx0ZWRfX0k9CXamDg+gT
 Kp72MziKx27tuHOpBAm/xiLuxmKGxmqYAs6/p/k9nMMst7Rzcwsw6PSyZ90/7mmK7F/0BPJYcPz
 +GgkBP8RAfPvun66Rk8/REJ8iDFgzfItusSQuz92XsZ38MAo0P5nc5ieI4xepzGMMZIV18XgXd3
 BJNIZeSN72Rbmhcagj65hhQyOHZFeqdvFyzzGPIgZvxr8mLyyqi9NKihJsT5ocfy72Gmethxnsq
 wg7DUcmQ2bmqGkiU2eivA7sdYI81aBEKKdMdTci6yTly3kuM9or5yiUhEDpj50Amcfaec3uie41
 VUu4k7hHHc34tBnhepWXQHfaj2LHu9EphTZH7KILd5d4TELooLzl1ANnVFIcZ5JbN7q0fJZBs4D
 DPwVVN5Wf4vEau8TE22AGNGEL8LPEQ==
X-Proofpoint-ORIG-GUID: Rj-bN0ZFClryVN7a3rnF4yWia0nCNHYD
X-Authority-Analysis: v=2.4 cv=IbKKmGqa c=1 sm=1 tr=0 ts=6941c211 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=VwQbUJbxAAAA:8
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NoIK8aywfEdJV_qt31MA:9 a=QEXdDO2ut3YA:10
 a=VkQg4iviJnsA:10 a=eNH5niYpQkIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Rj-bN0ZFClryVN7a3rnF4yWia0nCNHYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160173

On 12/16/2025 8:21 AM, Lukas Wunner wrote:
> [cc += Bjorn, start of thread is here:
> https://lore.kernel.org/ksummit/20251209-roaring-hidden-alligator-068eea@lemur/
> ]
> 
> On Tue, Dec 09, 2025 at 11:48:24PM -0500, Konstantin Ryabitsev wrote:
>> ### Bugzilla
>>
>> It may be time to kill bugzilla:
>>
>>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>>       active
>>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>>       5.2 development branch and continuing with 5.1
>>     - question remains with what to replace bugzilla, but it's a longer
>>       discussion topic that I don't want to raise here; it may be a job for
>>       the bugspray bot that can extend the two-way bridge functionality to
>>       multiple bug tracker frameworks
> 
> The PCI subsystem relies heavily on bugzilla to track issues,
> collect dmesg/lspci output from reporters and furnish them with
> debug or test patches.
> 
> The SOP when issues are reported on the mailing list without
> sufficient information is to ask the reporter to open a bugzilla
> issue and attach full dmesg and lspci -vvv output for analysis.
> 
> If bugzilla is deprecated, we'll need at least a way to exchange
> files with reporters.  Preferably on kernel.org infrastructure
> to be independent from 3rd parties.  A way to communicate with
> reporters outside the mailing list is also useful to prevent
> spamming linux-pci@vger.kernel.org with messages relevant only
> to a single issue or system.
> 
> All the information now recorded in bugzilla should continue
> to be available indefinitely so that Link: tags in commits
> continue to work.  It's not uncommon to have to dig in old
> bugzilla entries in order to understand the motivation for
> a particular code section that was introduced years earlier.

At least some of the wireless maintainers also use bugzilla.
The ath11k & ath12k drivers have guidance in the wireless wiki:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

So we would also want this or a similar service to be maintained.

/jeff


