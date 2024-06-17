Return-Path: <ksummit+bounces-1309-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A090390B605
	for <lists@lfdr.de>; Mon, 17 Jun 2024 18:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CF9281992
	for <lists@lfdr.de>; Mon, 17 Jun 2024 16:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F871D953A;
	Mon, 17 Jun 2024 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T2YnEG5A"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2AE8480
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640895; cv=none; b=u/R7QxZkAjpPpAXaSqwcmRXZSMAmXfvnQBNFgx38Wlx8aroU3wuKZvUrTpc1KxxO0NIkM26xjIg3qx/rUfqEqkF6oqVVUh4UVf6bRLpxIPsnPSoQM1ZtDBEy7gARa00zuTNx8ns34xnSih+G6WW+GXHO4R6NOfI3Om0T+dUNXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640895; c=relaxed/simple;
	bh=vh10UZ91837C+K1NwOiRmTr1k3A7rMCAnRBaSEGpKVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgUIhJyoH0s4W1IMLh2pmekx7wCMT7UVLzBXf+wCXAdXeLF2NbjX60C0eKbVlWv5HkVXHeIQH0c499QbTN4cE0NLM+Qh+yDuCQUWqStbM/LruORD3tAFN7o5cNOXksE8QVsC7uGjZHtQbgusgyW+T11YFVEey4mtQbEBcHJ7xoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T2YnEG5A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718640892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iCVj5ODz+YLVt8SSuHpzR9ADedqUy1hw1ZPpZjDUzeI=;
	b=T2YnEG5ACq74mUSBpRvrmYo/0MMjEiNR/P7EWg4s0xTc0+O0XTodnBTdO8wo5J3qpL/Hbc
	RX3xaW9uqy1LFwjuryHcjl7vFU2ADvrJGL3vc+m46i9a4xgU/SPl17oFE6L9cnZjoLnIJD
	vu5iCGsNhAMbmPFUWsTP6DtQ0xN3NiY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-ZNIPVA2vM0yKYzwzQrN-pg-1; Mon, 17 Jun 2024 12:14:51 -0400
X-MC-Unique: ZNIPVA2vM0yKYzwzQrN-pg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ebea49680fso40366631fa.0
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 09:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718640890; x=1719245690;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCVj5ODz+YLVt8SSuHpzR9ADedqUy1hw1ZPpZjDUzeI=;
        b=F1pRPrZlQmtwMAUoX9+mEfctAXCtyinfr9QVtmA0Bd5qtfH90GGxyF5YOoc3BptRAd
         ACjVse9Mv8521k6MZcWUIOn5FgGUxAFy2vJ+7g97irYCqLHqHJT39kfNXrpow5NghgGj
         C7Th61IByPSNfVl2xsRneLL/awH2geq67kk3xRMbuJptfFiXgzbQe01oHVxiPgdx9qYU
         k0EmHv5XrW+5kBmu/khw9/Pc3K97BIPXH3fTbtQkuXQey0055FnqkGz8xqNtWXCL91bd
         x5oErkWgZYKmZ9dIqywgw4+Dr23TAn1vGK7USlP/RPEwXzhPZR3tnjwOn9umZjEey92L
         h5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjfROTJEAZLPJ6H7GoLJKbTf5KGvcASxyhvwegedi1t7og/sRnoUgbAA6Nml9/KXrYgwnufk3+LtsGgMwEZcFkMMY1WCrdMg==
X-Gm-Message-State: AOJu0Yy9NoWPhLG+ZzOqSi83azEDGiVZ8/tjkLTz2se/4JycSouEv8D3
	AgE4VFv7gIbLAScEsUOSasXzPwVnRFNPGkRlMVTkcQ+YhQr1ek9gpZ8ISfg8MkL0/dlLHkRybj+
	Hnk4oLBdVFOg3UwsFHhrDD4P7MlP7dm4xYpPwGOJZw+Siuq7cE8n7wCE=
X-Received: by 2002:a2e:b0dc:0:b0:2eb:e01e:3699 with SMTP id 38308e7fff4ca-2ec0e5c6bafmr82994231fa.17.1718640890054;
        Mon, 17 Jun 2024 09:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBeSDEx1/xJg9YB3umRFeis/d74dKBTiP5O/EZlPBCGQ7bnIOJEYF5yp+9XUYJhuaF3m6ZbQ==
X-Received: by 2002:a2e:b0dc:0:b0:2eb:e01e:3699 with SMTP id 38308e7fff4ca-2ec0e5c6bafmr82994031fa.17.1718640889668;
        Mon, 17 Jun 2024 09:14:49 -0700 (PDT)
Received: from [192.168.10.3] ([151.62.196.71])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e702sm6663767a12.70.2024.06.17.09.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 09:14:49 -0700 (PDT)
Message-ID: <79b5f7fb-28b1-441f-a064-eb52be0d20da@redhat.com>
Date: Mon, 17 Jun 2024 18:14:48 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>,
 Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
 <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>
 <20240617-inventive-bumblebee-of-champagne-e133bc@meerkat>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240617-inventive-bumblebee-of-champagne-e133bc@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/24 18:06, Konstantin Ryabitsev wrote:
> On Mon, Jun 17, 2024 at 09:04:15AM GMT, Paul E. McKenney wrote:
>> So for your message that I am replying to, this would be like these?
>>
>>    - Link: https://patch.msgid.link/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
>>    - Link: https://lore.kernel.org/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch
> 
> The "message@id-here" means the entire message-id:
> 
> - Link: https://patch.msgid.link/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
> - Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch

Two questions:

1) just one is needed, right? (should go without saying, but still)

2) Is the "/r/MESSAGE-ID" format 
(https://lore.kernel.org/r/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat) 
not valid or deprecated?

And of course, to Linus's point from yesterday, this would only apply to 
patches that _did_ come from a mailing list that is indexed by lore.

Paolo


