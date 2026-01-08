Return-Path: <ksummit+bounces-2732-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5894D06298
	for <lists@lfdr.de>; Thu, 08 Jan 2026 21:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3122A303F359
	for <lists@lfdr.de>; Thu,  8 Jan 2026 20:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF5330642;
	Thu,  8 Jan 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="w9qnz7ti"
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4ED330324
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767905155; cv=none; b=k1M8xKry3JCVE23Q2pIwvRgYQ8UmzB+fl8bmX8FbMHqBQ+6FQszOldjtAeALmsyuZ9YVG14CwPjVuNvtdOSkI0iOYznkhkKkve/AalF9V2Ky2wDhjhArwUhxkSPTa0QBbZgRe/c8NgTleDsCApjFUdP/3Gq4Lllgr/7uxuCXkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767905155; c=relaxed/simple;
	bh=a31PE+KmmFRwXfnlKJC4zTat6x7aTajW4NTP2SqfUQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVJ6+wFCm3H7KoO/qEjDUs/0a4C9v7flgp5Vc6tMRWkGKP8Ntpxkxnjvfa3TUtmrptOPQGybvZKH5w75tzUIF7MTQGkJCcuFW6m2mN4FTOp2KWBCSdWsobYQAmvYFaXSapcDAhhOvxneWaJmAkKA7/Jv9Gkm2kkGHhBZNKM/0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=w9qnz7ti; arc=none smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-65d132240acso2165576eaf.1
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 12:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767905151; x=1768509951; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6zUMN/EGP8eMs0aX+0WOCGJSD0vj1CBl5LlanzlFek=;
        b=w9qnz7tiPRdDaHlStYRo3SNNFZIB7bfclyU1Et77tjPE9MdyJxg7lZCgdREmK3imSc
         SuRzdJ/tLKZ71rnbfROSXJQPlVFaYjWtpOxC6T97vwYPdU9mIrNWEIqQiCtdb/UaJtZj
         6ffBnRWRvFnhDjbQlW6O/6mmEpR2uQEI2UU8CBj+brJk8t79llU1/xY0Y9Ds0sbX4fCF
         fiL48YddstCp8SL2iAKZt1nuFXG+bWzQF3VS0KO6vDuBCvjqS6qGG6NHZcKE+F0cFklW
         W26LOTCwnl0rYlvWZsgslqRdy1ult2LJi5CUGDLLOywxoyVKRnSMoNr979LwGgGnOA0Z
         kIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767905151; x=1768509951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6zUMN/EGP8eMs0aX+0WOCGJSD0vj1CBl5LlanzlFek=;
        b=RgBrR8jNi/YcgUrWEIRvVLup8TtPuYHF15sr3feSgElfOKKpM0bAsFSWb630fsraKQ
         SH8ZX66WQW1Zk0xpGqWHp+WWrexIUjN5YwuixJw/Y1TikeFtVhEsiFvMgUpA95qUI6l6
         MdL3LN5WMMTtmmTLSAtoSDcJj+lY+M96wiuRRI5wY/QJmP/bV3MQ0lvdEkHQZHaoMdmY
         J7iknBMDMSflylxBFEd09zrwWjhLRJYOoslEhgTI7jv2hyjaND01aQj3LIFfOhLCNoL0
         zuPQ9aJwlb2/ar3JvaI4dv+OUiN3hk50eqs8Y6Wi1QmXU5GYsvfc1WyBs2maB86+Pd6X
         hWxw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6sis+JqSuu18qXHiCBrpaEYeaZA8xwyHcB74nv9sfsEPZ2dkUV+pNOyJ9d4SIhGZTM40trP0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6lEPzJj7PYLmXEE7VLdQmEygu1V5A95HlP/UKhxQal9BfBxnN
	QR1So/T72lHXV4SKRvrEBnVgPfV8A/J2d/OFLG3Ju9kcPDOeSqTB9fqN71K8g5IBZoE=
X-Gm-Gg: AY/fxX7DbFtb1yncQg4/6P1jPs6OmhVxaLP1zlhS1EJ57mHftllfFj0fgHoHQbosEau
	IOrH/3bq1vxBH5mGh9/TJitPtf/LrrUW4MDbLNU7vu2B2h8Xo9Jd/KJXbAhrT6LvogWFxps1rVh
	NAwqjgDa1rHat7Fl6CfBDqtqx1YRhpPUz62UlQ4h182Qr5lqpLcVCohCsADxF5Zvl853Z+Sq6lc
	y1xcDsAxMGAslIG9O8LpTulwvIFIJ16P9HOa/Vfkd42vG0lgP5LZzs9Vfn2uPf9n6Ngbh5JMa07
	iKlg6SE4B/biTP98Fe2PpKKsX9472C0PbanJJEFPRDi4aAUyjH4vXtZdaJTcyDvg2NGLBJeAK37
	7fjK0C1fcdCKQQVEovNf8Ld+4cb7GXUNlpyzWUQBbBMK81QMQTEp2rAJ+esnSA/sJP3HN8Xk2XD
	74v1jxIpIXtSjh6BRbZ2U=
X-Google-Smtp-Source: AGHT+IH0/MjgH9VE+wIVXmuw+NAnDw7hQ7uK9TlclrIg9b9O8SUUcvRvJc3q3qjWPeRksMKVCb02zA==
X-Received: by 2002:a05:6820:1501:b0:65e:f0f9:aa5d with SMTP id 006d021491bc7-65f54f4f816mr3174039eaf.40.1767905151369;
        Thu, 08 Jan 2026 12:45:51 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48beb796sm3567472eaf.7.2026.01.08.12.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 12:45:50 -0800 (PST)
Message-ID: <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
Date: Thu, 8 Jan 2026 13:45:48 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Steven Rostedt
 <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
References: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
>> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
>>   - Ask the submitter to explain in more detail about the contribution
>>     so that the maintainer can feel comfortable that the submitter fully
>>     understands how the code works.
>> +
>> +Finally, always be prepared for tooling that produces incorrect or
>> +inappropriate content. Make sure you understand and to be able to
>> +defend everything you submit. If you are unable to do so, maintainers
>> +may choose to reject your series outright.
>>
> 
> I feel like this formulation waters it down so much as to lose the emphasis
> which was the entire point of it.
> 
> I'm also not sure why we're losing the scrutiny part?
> 
> Something like:
> 
> +If tools permit you to generate series entirely automatically, expect
> +additional scrutiny.
> +
> +As with the output of any tooling, the result maybe incorrect or
> +inappropriate, so you are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, maintainers may choose
> +to reject your series outright.

Eh, why not some variant of:

"If you are unable to do so, then don't submit the resulting changes."

Talking only for myself, I have ZERO interest in receiving code from
someone that doesn't even understand what it does. And it'd be better to
NOT waste my or anyone elses time if that's the level of the submission.

-- 
Jens Axboe

