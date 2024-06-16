Return-Path: <ksummit+bounces-1293-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B56909C78
	for <lists@lfdr.de>; Sun, 16 Jun 2024 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45891C20B4A
	for <lists@lfdr.de>; Sun, 16 Jun 2024 08:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9721822F9;
	Sun, 16 Jun 2024 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vp2kZ1FN"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3B1822F3
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718526184; cv=none; b=qtj8Qpel5FRykOX4T19Cq4GoDjCAB9FR50hAppG/vuqf4S4jbh/2ELJ+06XBIUpz/I6eg0ixmykg8+WG6G0KCF+ITjjrVqLO9csHMqye8usIrDbfA+N7tG42lJb2swraUS5GhBxTFjZQtuOFUxYOTntgOYn4FX/jJPSkbncMyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718526184; c=relaxed/simple;
	bh=8eHMI35/80XUjuxeS73ht+PjTyVXiEiEeDBzpU6voYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgwnmmP+lge7Gykqoxe5bBuZ1XnH+LjRNmxBEeX7OZuWl88TEwpSxIeJw0+gAN13Bx7Tx0ylyAbmypYujDPKuspI8MV1AaZuf122IWw9nCp2HFzgQa8egtN8knx08HtireoxQYHWfPmAfObrjdr8ZQihNAs922K1rmF7sSdrRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vp2kZ1FN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718526182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/zkpapPgLVhwqoLdGa2/pqOYSWzAHLdXANCuIv+YXu4=;
	b=Vp2kZ1FNBsyFBJpM9SJMUvoqbN5Oq2s20bZigX1hoLL97zNjM55LIq65tmFzmA3VcjHiYT
	uqorvNrZ/xi+axL9JPXLRtP71qfMsJd4HnmSYw9ta0fUeE44E4N6eT5fHlQzczp/WFpF3w
	bLa07xEiQ9bpbIs6XZffXohKwuGGRiw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-K2jFlx62O0CQumdMajLqPw-1; Sun, 16 Jun 2024 04:23:00 -0400
X-MC-Unique: K2jFlx62O0CQumdMajLqPw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6f0da6cd62so310968766b.1
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 01:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718526179; x=1719130979;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zkpapPgLVhwqoLdGa2/pqOYSWzAHLdXANCuIv+YXu4=;
        b=fEtWOwKI9iDpAbVk588WELs+iN9FmNIyBiHzUyd5BXVKr0bAYqSorMZPby6pgaD0U+
         vHuNkfLw5CI5KMNZRaN82u8P9GNgYLFcL3vxO3QapLZ9puAgm3NVhnZPYJtDNVGDtRTB
         hFvM2bXJ9ILrlfpL4o3yrd5HpyvgWdAv1/oq47EtKFU5KnKVeYss9XG4f6LeGL5TW+dC
         xytv59HPoNwiAF1L88uPknldW2CnVqwpAB6IKhJkn5bOo8BOTxqLE7BhRr0+k+vOJ15t
         RMUuxqw2UL2IccsCfrySnxjs774imr6NXUb5ORPfIkTtrqaK1xvxwQe8skCvISrDZlzH
         7+ng==
X-Forwarded-Encrypted: i=1; AJvYcCVYV08thtSWScF9IjgJ5tExw+zIjqH5bdJvcQabWRoTuhYhRWGM53Dz/1FZgvW4VA1M0cGQkeBTvcwjjhfN/t9XGsGhisuAtg==
X-Gm-Message-State: AOJu0YxbW5mEvVixXvyCihtyky4mOlsXGQUph7N6Ci5YoYFZ9VXM1st+
	zZKsFJY1d+NPoQnk+BxSMIlnL4xExWyTt7GslH5w2+4YgQRIuF/fRC4N8a7w6H3osXWhjvVErhU
	gB4LZm0IzJjZ4RRAG++RdRyQdh5AuaCTaJKX1Zo7smZrE7vHo7lKZK/g=
X-Received: by 2002:a17:906:451:b0:a6e:f8c1:8395 with SMTP id a640c23a62f3a-a6f524037bamr597153566b.9.1718526179087;
        Sun, 16 Jun 2024 01:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQs5NDJRtBd845pWtCQlG0kg5SMU09oZu7qVn0jEiOVs7+ReKNhh0o6J1fMB7TNEXpUqszqQ==
X-Received: by 2002:a17:906:451:b0:a6e:f8c1:8395 with SMTP id a640c23a62f3a-a6f524037bamr597152566b.9.1718526178720;
        Sun, 16 Jun 2024 01:22:58 -0700 (PDT)
Received: from [192.168.10.3] ([151.62.196.71])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56f427a5sm377730366b.180.2024.06.16.01.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 01:22:57 -0700 (PDT)
Message-ID: <841e528b-357a-4bc6-bc42-1c4c2f13adae@redhat.com>
Date: Sun, 16 Jun 2024 10:22:56 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/24 06:59, Linus Torvalds wrote:
> Here's the thing: if you applied it unchanged from lore, you already
> have the email address and a date in the commit.
> 
> Are you seriously saying that you can't find it based on that?

Sure I _can_ but it's not especially handy (bordering self-inflicted 
pain, tbh).  Having the Message-ID of the URL makes it a lot easier to 
find the message in your mail program and reply to it if needed.

I also used to have a script that tagged as "merged" any messages in my 
inbox for which the corresponding Message-ID trailer appeared in 
linux.git, but it broke at some point and I never fixed it...

(In fact, that is IMO the main point in favor of Message-ID - use it for 
the plain message you're applying, so that it can be used to reply and 
for tracking purposes; use Link for the discussion that _prompted_ the 
patch to be created.  But I'm not going to argue too much about it).

Paolo


> Now, if you*base*  your commit it on somebody elses work on the lists,
> you should most definitely say that, and say something like
> 
>     Based on patch submission by Xyz at [1]
> 
>     Link:https://lore.kernel.org/...../  [1]
> 
> and that's_wonderful_.
> 
> But if you just did "b4 am" and applied a patch, what's the advantage
> of including information that adds no real value?



