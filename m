Return-Path: <ksummit+bounces-2919-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxeMKIalIGr56AAAu9opvQ
	(envelope-from <ksummit+bounces-2919-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 04 Jun 2026 00:07:02 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027863B801
	for <lists@lfdr.de>; Thu, 04 Jun 2026 00:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IZxfQI5I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FduC6V96;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2919-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2919-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FEBD3019805
	for <lists@lfdr.de>; Wed,  3 Jun 2026 22:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6293FCB27;
	Wed,  3 Jun 2026 22:05:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F63D5C26
	for <ksummit@lists.linux.dev>; Wed,  3 Jun 2026 22:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780524335; cv=none; b=OG7CPXqN+CNsmOe6cqQkd2FeuAT9BC3qLN8tDij07gwYebn96IEmI8v6nuwYKprWNu219NOVL5XxppofXmh1dUGMfCe3YODiBBkf/TJDzCAuhwJH/xVMhmlBxhxmESTyRrcjhOFrO9jQdj5IxlJ5acRh50gjmyCd17YfQ3nrjy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780524335; c=relaxed/simple;
	bh=AkThOQLeOIrUfmRQJigSWhORB5bwSryL0zJTqC1aeCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQhOKjxrnRlFMRhe6iH9Rt2c/DNldbd9Jm7AqpKio3yXFis1UoR9l+T6x5R7i+a5FrUI/FjNpgjER2A7+8+hnbejWj/JM+q4V9lrEdaXNTNHEArCNAyXIhDD0e3tpYfeaUg3eq6iiQbyQAsNel8sl1/WGYe9YD3VsXE2YIlINCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZxfQI5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FduC6V96; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JOWDB1740479
	for <ksummit@lists.linux.dev>; Wed, 3 Jun 2026 22:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8UUfrEp9Kdf8/e4xwQXe8vKGGFElUHiMEFuS+5lE3c=; b=IZxfQI5IeBodyOKY
	vbRQFjxegW82lMX6Vorfnk5IPiZbv+M8pSjGv5Vu+uZ8pnKfO4//HJoZczZU0tF4
	0HOp3ZsmhvPUhHQO4L63k6NpNMEWC3T7GUoeNoYHduM6UDT9Ch+DVSLWaF0Vmzou
	NeqwO/J4fGZnJrX/JP9GPKxx5xW4bFZQTp+cKXwd0R4oBB6f6nzm8MXDFUTYgLRm
	IKKudjgg8rCuKCKbbxb7wlM9E8R2SSv7nZypgsewxaynTJp8revm4M7fiwJS2Hxb
	JbBtMU4CIA3pUvlVbVvxtsT5KDSOx+IachA/G26iWesZc2Cp5X1E+o8xor+Tosm8
	PuxNhA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7v7gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ksummit@lists.linux.dev>; Wed, 03 Jun 2026 22:05:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb5407c95so6286e0c.0
        for <ksummit@lists.linux.dev>; Wed, 03 Jun 2026 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780524332; x=1781129132; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8UUfrEp9Kdf8/e4xwQXe8vKGGFElUHiMEFuS+5lE3c=;
        b=FduC6V96LFV0cJ2Wl38HVkrvdqzBDjmvq9I/8exGxch+8VGOTbtQG0uKO+Nhyvn6Eg
         V6lK7B3H6D19MTF+Fz+aue6lVSEx5IQ1i5kbqAlgFfPx9avm1lMIoXMV3jLV+VldvFiA
         K1+FhZdzICr/Q1kLb/AClSPJWgK+NM+Yd7DyE4QYwNM0Bf2MMChLXM5IMYZPV0Vc+TPc
         rCfFkOsXxTYZZRPEh+UKfBsXLqSiJmpq+cEtXfTx9uPh41dSVSy1FDo9IJpQDb2pEgYY
         TpoGIGnbcv7O072wctlq4MbAdtq7wLZ4JObY73rf8UqfvFwIwELw/ALX17dju+0Dkft/
         SfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780524332; x=1781129132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8UUfrEp9Kdf8/e4xwQXe8vKGGFElUHiMEFuS+5lE3c=;
        b=f7nZXOtUNtKZAjnS4JpYBgGMyxAs1gk/mDQ5rE0c+VgzynKmCO1h/yz8w/Loaew8Rd
         zlDNV0aLKY96zskUoGnqMVxUG4OlXtAaR9RU1vr/hXERunceDUohQgTDWN05nwU9wPAz
         UgTXKxMwDal7bva0XDq0axwgZuqlVvq1tSPLN8axceF1evypdxsuxAuUhK1pgLxO/AtV
         yjuK+hKxPxHyeG/9vQNBRnl0isD7F2ndf7nw9Zv8kK2FyzVlApAu0O0GRIQ1Xe+p3rIG
         zfS9zFlAfv+LO5nkpLf8lRmzQC4roRoUWdjCg16ArStFQCXYTFQVFfH90Y89/li969lB
         uBPw==
X-Gm-Message-State: AOJu0YxKLnCfn1uJ/qqSbDq2A4wBly/KRpsmuf3r56MI/I1fd4SFjGqj
	LdjNvYEP32XeYHTWbOcWnqMjEjYUzl6n6vIlrgwy1PVxChuZ7oGgui01eXKhkGSLBc+Eh8WcoEH
	ZPktOBZ2o8Jygk00CzDTxW64hOpipt1LC6U87Jd5RF32Z5yYDxvwBQNYwNrk/
X-Gm-Gg: Acq92OGbcBu830OvGJwogtwzn8JvDI0koSxSHdzmtFZYLLnP/xt7vKm0tMEJvHTmOpx
	PcCA/JRlS3hXx8Tq+Xibwg1FJEjLz4uMVMLDPBaeF7oqsK2iSsWE4wO6apPNhIv7ncbcitth/M1
	h4z5Q7hrhPDXt2JtUIKygygD2R6YqYQyGDf8jZbR7uBg3+Q/ZfgCbo0RmbFwW6X/Qv2V4OOTK9L
	s8yjz7X0u9Gwc9lVW5EH358kOyE3Xtxr5sjjI+knK1xv3RyPwYmI2e7L3USDjnuaemU7uwruNto
	MGmarbOpzRfPKm9dJgUdELJRtKAIk0lic1nf9nvpGnq8xCrrS0UF3nrDBHL8nqfLxUKGphZ504i
	997cqYjM0Am/a8Nw56ERazPb6nu8q6MLRzdgm/bJk8sAfJfG7w6bDGJmEAxf5KFnqAgKnl2rx+4
	7WvJaJOta1K9w=
X-Received: by 2002:a05:6122:8291:b0:5a5:3619:f764 with SMTP id 71dfb90a1353d-5a6e9a9f090mr3159856e0c.14.1780524331562;
        Wed, 03 Jun 2026 15:05:31 -0700 (PDT)
X-Received: by 2002:a05:6122:8291:b0:5a5:3619:f764 with SMTP id 71dfb90a1353d-5a6e9a9f090mr3159833e0c.14.1780524331018;
        Wed, 03 Jun 2026 15:05:31 -0700 (PDT)
Received: from [10.175.46.197] (37-33-141-148.bb.dnainternet.fi. [37.33.141.148])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b042sm860647e87.47.2026.06.03.15.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 15:05:28 -0700 (PDT)
Message-ID: <6eb7200a-4e5c-4cb3-ad21-85ed9c477338@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 00:05:24 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern
 age
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>
Cc: ksummit@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
        Maxime Ripard <mripard@kernel.org>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
 <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxNSBTYWx0ZWRfXwjAIJ2wdetHu
 pD3OO9J6BkJbD3bfG8Pi1gxYetXTNc+Crn1xY2af3kxJ07XHGRi6/QxplOKObmwDquZ+WCmbB2p
 CB3aXxcLYMYiLvgBCoaDJ33zQmFR/qaWAtWxEC4FAG62xWA0eOy8z6uFQK1gTaKf/hqZY2lUTc+
 V8pSJ4mEmU/ENsu/jCx7P0Eg9vLgYvr3aMJe6ZphQZhIHl6ywHbDm2qdVNUK03WoS7s0PN4YW4l
 C5yqs1TGWvo0ZhZLdWz1ZotI7bWDwrBOtHoLA4idJooE2EHygjaZ25TZt1jXNpTQjwLB8veYK1a
 V6pvmu0Ktls/tzQK+BK1OM6Kcszz/pTOYaCmrDGKNO+dS/QpNOUv+mUbwf/UFfe8phqgBirKKwA
 c9XrxqDfjY5Acy7wE9MQ6YEdTt1uDEI05syl16hO+7ASjKS9aM07LoUHwzGfsBDL5HAl5IW0DZU
 8mHaC2zXYoN5nspk7CA==
X-Proofpoint-ORIG-GUID: G2q2yxnRybwRWRl9N5ta3BqrxA4dbEWM
X-Proofpoint-GUID: G2q2yxnRybwRWRl9N5ta3BqrxA4dbEWM
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20a52c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=HmWCCXOzZyWumUX0GcTjpw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Oh2cFVv5AAAA:8 a=KKAkSRfTAAAA:8 a=38F2tOPaGkSplCyNt-QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-2919-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,googlesource.com:url,linaro.org:email];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0027863B801

On 03/06/2026 10:10, Neil Armstrong wrote:
> Hi,
> 
> On 5/26/26 11:30, Linus Walleij wrote:
>> Hi Neil,
>>
>> I support this topic. I have hesitated to sign up as panel maintainer 
>> mainly
>> because I have too much other stuff to do.
>>
>> One thing we need to discuss is the hostility or active disinterest of
>> panel IC vendors to the Linux community, or maybe to all their customers.
>> My general impression is that they rarely publish datasheets, and if so
>> under NDA, and their idea of a driver is a bunch of opaque custom
>> commands sent during panel start-up and other infliction points.
> 
> I agree, but on the Camera Sensor side they had the same issue and started
> speaking directly to some vendors which actually accepted to provide docs
> and even write sensors drivers themselv es.

Unfortunately, for display panels you need two counter parties, the DDIC 
vendor and the glass / panel vendor, with the panel vendor usually 
having the NDA with the DDIC vendor.

>> Has there ever been a single kernel commit directly from a panel IC
>> company such as Novatek, Ilitek, Samsung (their panel business unit,
>> not Samsung mobile), etc?
> 
> Not that I'm aware of.

Not that I'm aware of too. Some vendors (like Waveshare) contribute 
their patches to the vendor kernels (RPi).

>> Do we have any indication that there is interest from the companies
>> actually doing display controllers?
> 
> They mainly speak to panel makers so I don't think they really care.

We have been going through this for all other classes of hardware. What 
would be the selling point that would make panel vendor learn about the 
upstream Linux process?

>> My view of them is that they seem to be a bunch of company in
>> Asia who are deeply suspicious of each other and just think their
>> competitors will copy everything they do, but this may be prejudice
>> from my side.
> 
> Yes, but if we could speak to the DDIC makers directly to support those
> in a generic way, we could simply take the panel parameters from the ODM
> which got them from the panel makers.
 > >>
>> On Tue, May 26, 2026 at 9:41 AM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>
>>> Furthermore, it fails to support advanced Display Driver IC (DDIC) 
>>> features
>>> that modern hardware heavily relies on, including:
>>> - Standby and advanced power states
>>
>> There are at least some standard DCS commands for this.

How would that map to the DRM power states? The feature that would be 
interesting to support is the per-brightness power states.

>>
>>> - Advanced color management
>>
>> For example panel-novatek-nt35510.c, my most ambitious driver:
>>
>>
>> I have added driver support for this based on the code drops from 
>> Novatek.

I'd say, it's pretty unique.

>>
>> So what we want is being able to actually adjust these curves, like we
>> do for professional monitors.
>>
>> However without the datasheet how am I supposed to do anything with this?
>> I can't just trial-and-error such stuff. Novatek need to back any 
>> attempts
>> and provide feedback to do such stuff.
> 
> We also need to provide APIs for this over multiple DDICs, but what 
> publicly have
> is very limited and most of the commands are not documented and we can't
> compare between multiple vendors and implement some generics helpers.

I think we need at least a second implementation before considering to 
turn that into the API.

>> I guess adding gamma correction to the panel frameworks and using
>> the existing infrastructure in DRM for this is our problem, but then 
>> we at
>> least need to know what we are doing.
>>
>>> - Dynamic rate switching
>>> - Command mode self-refresh

Also, the HDR-related features and quirks.

>>>
>>> This lack of evolution has led to severe fragmentation between upstream
>>> and vendor downstream trees for advanced devices support, creating a 
>>> heavy
>>> maintenance burden and making native hardware support incredibly 
>>> difficult.
>>
>> How do these vendor trees look?

https://android.googlesource.com/kernel/msm/+/android-msm-bluecross-4.9-pie-dr1-release/arch/arm64/boot/dts/google/dsi-panel-sw43408-dsc-fhd-cmd.dtsi

> 
> I only have experience with Qualcomm and they have an ultra-generic driver
> which can run any panel in the universe (spoiler: no) with some super 
> complex
> DT entries and support all those super complex self-refresh and dynamic
> rate change.
> 
>>
>> I'm curious. What I expect is more blobs of random hex digits without
>> explanation writing magic into the display IC and named do_the_stuff().
>> But maybe there are actually some real first class citizens here with
>> proper structured drivers and a datasheet to back the code up?
> 
> There's some stuff with the DDIC but some are in the DSI spec, but since
> we can't any of them publicly it's hard to implement those stuff without
> a vendor willing to implement all those features in the DSI host driver
> first.

-- 
With best wishes
Dmitry

