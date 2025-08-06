Return-Path: <ksummit+bounces-2088-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF0B1C0BE
	for <lists@lfdr.de>; Wed,  6 Aug 2025 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EDDF18A4023
	for <lists@lfdr.de>; Wed,  6 Aug 2025 06:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9812135CE;
	Wed,  6 Aug 2025 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gh0Ov+Dc"
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7702116F4
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463505; cv=none; b=VeTwk8rRfPkt6q3W8fakusB14mj66AghJs0s1AVd7CHkBgdkkRmGZUOfy1e7xGcWkO/vso3VddyA7AdS0YOMT9NYRd7NGHv7Y6GYDl5eGIQ5ZZRvyblD11ExXPEe7TiU/NOpuG0oewHv/HwApOnF7Qh/VOHB9PXb5bAlzKUjRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463505; c=relaxed/simple;
	bh=ZSHEdA+GH+mZJYeB0AyV1Wf1gTxTSykV6d/hK0TlR2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tu4gLiQw37+GpucqqfCZHhy7I6AwPrZm6ZyBgktedm/o+wHKUtxUJ7WouTH7+rUTduTqhvrSG/K6dK79NAF0n1VAA7c2d+R1JwCJp0MjsoMm1IMS3VhCPqy20ldg924HKXSODzvMiHqxAz2e16tml8pfliR18dUcHt7Fx0dwozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gh0Ov+Dc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso27426775e9.0
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754463501; x=1755068301; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSK+Ee79UHVDiBLcmRlfAiP/6hXXu/G4N5sseUBz5mA=;
        b=Gh0Ov+DczvEg1bTxer4uEE+y3NyxCtHXyPek1d82+F35Q4S4p/KKAdeoeBHZsPpnNf
         wUPbKcbA9nSHp77Fjq1cdS5rOSRNJsD7Vo6BrL+oDp4US6GaWD0TiW7z1YnHYki6MJKn
         axz8hYeHYxZfAtWiomgC8dq0kTxsxsYgX59P3SQdrWjsC8vLF2G7Rh2OUcdiJLyVogir
         llSXFF99+07FlTpHPTsiRl9BYiTveYjrVvKqy2b0t8WhSUBnMpjBKpxLksudyeYofzop
         dqUJztzasRUtzPKu1k6PHVUrgbOTvvi7CF0k3yTZZ4PV2wFLmAxl0HckmXkTNSgSiAkc
         PTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754463501; x=1755068301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSK+Ee79UHVDiBLcmRlfAiP/6hXXu/G4N5sseUBz5mA=;
        b=ZWMo6piOgXufuC9/Mj+F7iVWz962cCOEjIsLPpASyZCzWwQNV9oCJqxFp3bMiTUrps
         GWXC12HSK5BmcI1jXwND++oO8FwAyq3tn9WXZC8l06I2N2O+N+/GKIDQjFvtEkRWhqsG
         q5eEXCu1e8IZ12nMXS4o+H11Ddh8MtT7aMfeNpOpGNSD3TRprzbIU3jm/yieXt+QDAJM
         1drZ+BSFPRkV6MWvM+TxDFcJEJAyLGnYnLr8KM6LuG3u1UcwUH3suWW8ptF/fxn2JX0Y
         ibHhDJRRcEWmGTlGwEoRkicNvuJGaZNNoBRa1dWDzdUUTrmbAeYT40ZmL7FkQvVWBai8
         JOsA==
X-Forwarded-Encrypted: i=1; AJvYcCX1CrqjOUH+tMIC+5RdVR3k86t+sYbdQQYUs9qfafnfUMEmvIPZe3l9lEW8K9dT2iufJ9fuLLjd@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ/zGUnEcK8uiXKH7CpoRAve0rcROJzNvvVtS+7lXrhCffL9va
	KKQYU1AjaUg0tAY72qZ+G6c3Z7l2sX6KVUelccjXNm8VGgcVJA3G/Od1s6XJWVQo/tU=
X-Gm-Gg: ASbGnctWCawlvsLGey0vnKNdEPDBf5QtaEEvuGTTVFQw1oxpL3KzHwVxKOVo+sfF0A5
	HpU+XQgtRhOL+P88kt9zSe22SON4T6PVMObLaOOwo1fQ+pR9BaYlZ2s57Uq7RBaBMT2nL//lJgg
	9iafsQE91PQexEVqsBvx1FzwXxPTLq0SaqKg2eDTHZGjhpLG3pesRYzIj4zAGDyuOUfU2UXBir6
	OAgYJw2L9HcWA/THPmavwb4p1+aitlgzqm7MY69aUxpRHHdj38WX7bYujMgMQEEBKn/w6h9dBnj
	FQb0z82rIHVXRm5rN+Z/+Ey1Wr2l0TIbuNZzBgRSauSXDoTWHfYRyxIaduWMbx7K1ItGaVIfxgH
	3aefQZgc/bTj6v/MI4zVNHbpl5vXNp4CM926i9IUgXL1f+2sOvn9l7JhOP6dV
X-Google-Smtp-Source: AGHT+IGONfxS7ZuByqt/A7BltD4MR+Qz/VtulgMxGBl9U7/YUKHc25ogj62LtcoKUAeXijsDlXX/Dw==
X-Received: by 2002:a05:600c:1d23:b0:459:d8c2:80a6 with SMTP id 5b1f17b1804b1-459e70fcc2dmr10193435e9.33.1754463500983;
        Tue, 05 Aug 2025 23:58:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:2b4d:5001:a0ac:8837:60fe:9611? ([2001:a61:2b4d:5001:a0ac:8837:60fe:9611])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5879d76sm36328285e9.24.2025.08.05.23.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 23:58:20 -0700 (PDT)
Message-ID: <0b58487e-56fe-448c-ba22-80a2e7dab763@suse.com>
Date: Wed, 6 Aug 2025 08:58:20 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
To: Jiri Kosina <jikos@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.com>
In-Reply-To: <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/25 23:58, Jiri Kosina wrote:
> On Tue, 5 Aug 2025, James Bottomley wrote:
> 
>>> * Equally, LLM's can introduce very subtle mistakes that humans find
>>> difficult to pick up upon - humans implicitly assume that the classes
>>> of errors they will encounter are the kinds other humans would make -
>>> AI defeats that instinct.
>>
>> Do you have any examples of this?  I've found the opposite to be true:
>> AI is capable of really big stupid mistakes when it hasn't seen enough
>> of the pattern, but I can't recall seeing it make something you'd
>> classify as a subtle mistake (I assume it could copy subtle mistakes
>> from wrong training data, so I'm not saying it can't, just that I
>> haven't seen any).
> 
> Few months ago (so state of matters has probably changed a lot since
> then, I have no idea), I've seen a GPIO driver fully written by ChatGPT.
> 
> It was functionally correct and worked well. But it was missing error
> handle here-and-there. Is it subtle or big?
> 
Which (curiously enough) raises another point: Procrastination.
We (as developers) are _terrible_ at things which we _should_ do,
but for some reason or other never get around to do properly
or at all. To wit: Error handling. Or: documentation.

Yet the code base we have written will be used as training material
for LLM. So I am not surprised that LLM lack in the very same
areas (how could they otherwise? There is not enough training
material...). And I guess the last thing we want is LLMs inventing
error handling.

But anyway. LLMs are great in producing something where 90% accuracy
is good enough. But that's not how coding works; so one always will
have to review any LLM generated code.
And that at a time where we already have issues finding enough reviewers
for code written by humans.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.com                               +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

