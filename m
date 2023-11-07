Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCA7E3758
	for <lists@lfdr.de>; Tue,  7 Nov 2023 10:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B111C20A26
	for <lists@lfdr.de>; Tue,  7 Nov 2023 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E136510A14;
	Tue,  7 Nov 2023 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NF/ErWXf"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA598F6F
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699348748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KpjBa/pCnV8+qNb73qExvUMQOJ2/Gs67LRjQyoYnwn4=;
	b=NF/ErWXfTWvI4ekbpwKOa9i+OOYpFdGvSosSFdWyqylHD8O1weIYtoMzE6GzW+oHfRc04l
	e1T6k1IprmM/llM4YLIdnvWpWLd4VtCPpqhHGO1vc0vDJgO4ZDTgHG7Qix+5B3tjwZvBRT
	Zea3YV+k3qeskoxiFjRTz+UCtNF7/44=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-2PdrM0x2NGa0J6cavbnRfQ-1; Tue, 07 Nov 2023 04:19:01 -0500
X-MC-Unique: 2PdrM0x2NGa0J6cavbnRfQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-408508aa81cso35920045e9.3
        for <ksummit@lists.linux.dev>; Tue, 07 Nov 2023 01:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699348740; x=1699953540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpjBa/pCnV8+qNb73qExvUMQOJ2/Gs67LRjQyoYnwn4=;
        b=FWvV6AEFtyUspzX3i2SqhmHF7D9KX080WFP0AYLvGrqX+dUuUNR3pIsB8+AtcU38lk
         L3+nkPTAk9onPhw11dgF8Y8JmOFrdZeh1d4tUJbXnIsykWa+mlNo1wsSPZw6Paop3oIO
         i715da2GpCtukF1wluSIyYFySkW4Wc/jen0BXT2kAtJlSQYh8uxlaLHh2bT3jALAzSK2
         2vEgEp4XwvYu+yDg4pfX7u5wbCe7AkX2OX3SGHNI6ZilN3a6pnf0Ee4OOs9xL0bi9tVr
         3cffmpnazh6WORhvDIomgx5JeTio1mC6UrZhUi566AY7OeFvNmXHEhYkmBcqzSYIk+N1
         8x3g==
X-Gm-Message-State: AOJu0YzylzHQmqQeQrsnz//oF991bmhAfa6qFnEx3PV3TLomPafVgw+d
	3+uFLSg73YKP1FKyiz0YCdgteFQMT2HHwP4e4KYFneDtQgHTLud/fYF7M8MyRKuDMvHiwxQORPu
	M+rtCnysZxUF1vjNU6w==
X-Received: by 2002:a05:600c:548f:b0:409:1d9a:1ded with SMTP id iv15-20020a05600c548f00b004091d9a1dedmr1579032wmb.39.1699348740586;
        Tue, 07 Nov 2023 01:19:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd7iPH76AEjt69qXsAJZnnA175d0OyoJ4f+Z2QYZbjjvfuzXT6nWgNS4K4YAjElOi2ZpJADw==
X-Received: by 2002:a05:600c:548f:b0:409:1d9a:1ded with SMTP id iv15-20020a05600c548f00b004091d9a1dedmr1579020wmb.39.1699348740167;
        Tue, 07 Nov 2023 01:19:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id f9-20020a0560001b0900b0032db430fb9bsm1781377wrz.68.2023.11.07.01.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 01:18:59 -0800 (PST)
Message-ID: <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
Date: Tue, 7 Nov 2023 10:18:58 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZUluOoDjp/awmXtF@duo.ucw.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/23 23:52, Pavel Machek wrote:
>> For this reason, I propose switching the "F: *" entry in MAINTAINERS
>> ("THE REST") topatches@lists.linux.dev  instead. This list differs from LKML
>> in the following important aspects:
> How many patches are in "the rest" area? I don't think it is that
> many, and I believe those should be broadcasted, as it is not clear
> who should handle them. And lkml seems to be reasonable place for them
> at the moment.

Indeed, I suspect that a lot of the traffic to LKML does not come from 
"THE REST", but rather from people using a git-send-email configuration like

	[sendemail]
	to = linux-kernel@vger.kernel.org

I'm afraid that having everyone switch this to patches@lists.linux.dev 
will take a looooong time.  Right now I import LKML via public-inbox for 
use by https://patchew.org/linux/, it doesn't include all messages but 
it's pretty close; the patches@lists.linux.dev mailing list by 
comparison hardly gets any message apart from Greg's stable kernel queues.

Paolo


