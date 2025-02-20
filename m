Return-Path: <ksummit+bounces-1733-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A6A3D169
	for <lists@lfdr.de>; Thu, 20 Feb 2025 07:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FA8A189B7C4
	for <lists@lfdr.de>; Thu, 20 Feb 2025 06:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D721F1E25F4;
	Thu, 20 Feb 2025 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsdNheJv"
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ACA8F7D
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740033141; cv=none; b=aNUr+6Gbvezqz9Ef70jfipSz5+ZGSFX0smOeEPnJPbuMGK+Ztqkt6kutUQhgzWrHENJaWh2WEU9Rz62agZZJBH9nin0C09UFHV3QsvE9u3Mk8gSD0fK32acqZ+Ugdy4f+7PEg+dBFszOoSroAbZUPM18un9kJ+EtCbRXXLiuy5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740033141; c=relaxed/simple;
	bh=xmAD4u6j6OS5zIIwffDsWNIF57ClSi1xWQ0nmzyLKzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDx5MGb0+elvE+PTp9uh+nChRvMYFKoIn3vueU5wQx5DEocwHP0BgQbACR17bbYbAcKG4YiOcvpw/y5sSkic5Lf6PH/6Gorg7z5tyH4Y/qaMqxJaZr1xZDo/PwWPZCfgPFKMHPztouwwCSZDhYIfHcgyi6Mt3oxbaEVbUUlYqIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsdNheJv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb7520028bso83271966b.3
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740033138; x=1740637938; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psF+r8fE563D6h4ZNSHAj2zKZZA4InS9LAIyTg/Ev/w=;
        b=gsdNheJvUW03Dw78UI7GT8ATv8rj3HYp9c2Ot9z0EW/zhc8/TRzBnCQ6dl0ygGECVG
         yGERNjU5sZ+7oBbKMzbR75qotqRg52RJuraPgDzAogiGPWKgJt+XdSNdTXddCjzvYwD4
         Xl7njzx69rB0M8spfwMkOnCLE561iTb61Oaa6kkuek7Ev7Wl1nO3tiRYJfGeMB09x8Rl
         4s8W1pbIMuAstfeCAalRnRnPIkY0UkppGDjH9bKxxbmKEs9fVcYHxwIbG5g5MptdrUzp
         Tmu4ZShAP9Fw8MyFk8Qc5cS2bp9wKevDXBJpUcWk4Z+FfLolbIOiDh56DF+gHUvJfyNU
         koig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740033138; x=1740637938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psF+r8fE563D6h4ZNSHAj2zKZZA4InS9LAIyTg/Ev/w=;
        b=jPrKIiKaLN4Ej1aMZqMc1jxrjTGJIA4Il0NQLznuPCc3rRd4wC0XpCimkB+ARxu8C+
         ZfMDbPazCLhAZVBTCu4cFuVg5I6PI7kukO3M2quVLDs6NaOXsAFcpyzIw9Hv4GPFKFVl
         tjcWOBN5VUyPq/RWQHsTMjGBEju4E3oX8d2fNg05nbjjtXn5t46Bkei/VLj5EqTv6kVU
         ej95hp5P5iM2odJyqHw0fsR9LM/4z0/sj8gelilFC82ZKvs9W9awWYjsB4V7gN7aUP7q
         kcTVYebI112PHYj13HI5miEX2TTHPUOwHm6dYCtaPw2QNxvxMDhe9xdCCquR6AyDL/Ik
         teAA==
X-Forwarded-Encrypted: i=1; AJvYcCVC1RPom4/mT2xt8IH6ZsX0WftLT/OFbTEOTNjgsIVrzY9ttIwn+9XZC0M/nkZVIt/bEYz7a6Cq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzg0PNueWAY0OJdDqs6VnaI+dFUWg4nih48VqonlPGg93s5BTg
	m3sUzmd6Dr6P6vzNeMj6Uzx5+UquoBGKHjGL99QyzxajDgDkRa0=
X-Gm-Gg: ASbGncsXzrLikSOgp7534V7sd+sbLcY83sV2h6pQk2PpIMvxJWas7X7tyygpSqvz8/S
	sj3I5YUFTNn7DoIhGVCHboLtbnb/0vWdqHJMDmJo+XXHr43ZdAV30n/n0ytYdho+Z3e0dH9JQ+O
	kXIyteCQx13Omol884QrLwyCKuywBziiYKFqGSGKp0j/N9yl8KFBNuEayApl2kvCaPXEaMNpWm9
	somokwmq1gkE8/4AV6gZduGg7Ez0igNkCC8s6ICC3etTpiFW59M0E4yDIKRraGob7JXnuK9jj9v
	okgyxg==
X-Google-Smtp-Source: AGHT+IHkTyohRQl8pq+ou4BMJ351iOfL/U1YoZ72qwAGSKVj+4Rqfvr4zd4x2I5z/J9nLw0RM5D7xg==
X-Received: by 2002:a17:907:3da9:b0:aba:620a:acf8 with SMTP id a640c23a62f3a-abbccebc6dfmr566419566b.24.1740033137657;
        Wed, 19 Feb 2025 22:32:17 -0800 (PST)
Received: from p183 ([178.172.146.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb836ee14dsm906966366b.47.2025.02.19.22.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:32:17 -0800 (PST)
Date: Thu, 20 Feb 2025 09:32:15 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <f77d549c-b776-4182-b170-571d1e5bb288@p183>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <202502191026.8B6FD47A1@keescook>
 <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>

On Wed, Feb 19, 2025 at 11:33:56AM -0800, H. Peter Anvin wrote:
> b. Can we use existing mature tools, such as C++, to *immediately* improve the quality (not just memory safety!) of our 37-year-old, 35-million line code base and allow for further centralized improvements without the major lag required for compiler extensions to be requested and implemented in gcc (and clang) *and* dealing with the maturity issue?

We can't and for technical reasons:

* g++ requires C99 initializers to be in declaration order,
  even in cases where there is no reason to do so.

* g++ doesn't support __seg_gs at all:

	$ echo -n -e 'int __seg_gs gs;' | g++ -xc++ - -S -o /dev/null
	<stdin>:1:14: error: expected initializer before ‘gs’

  x86 added this to improve codegen quality so this would be step backwards.

