Return-Path: <ksummit+bounces-1823-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA8A4066F
	for <lists@lfdr.de>; Sat, 22 Feb 2025 09:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619A63A87AA
	for <lists@lfdr.de>; Sat, 22 Feb 2025 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF942066ED;
	Sat, 22 Feb 2025 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GERqCj6w"
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1572063EE
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740213677; cv=none; b=a4psbR2NywszoNHDeY+eFcsE/Il0QqskccG/bCDaWv9hv67nCXdx0Vzr3BgZjy42wGc4c3e19iVhD0610IBDLL3V8pzpGwaw1WHehvLhc7nNYb3KLs1XKv1hCzmuyq7ebRs5h2Ww7zalHSDRUb2PrgvEnGZthaaVP+uKTPGZjFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740213677; c=relaxed/simple;
	bh=ipT8QGteDw5f/sH4Qq/CmGG+rJIDqYmTvgmdclMSeJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGkkeVB8Owr1+okg67p5/kzTkkZi5lf56kRvILf8SX4418sVCvIVOnRpdWunL9A5CRf9wzE32CGgRDSz4u7B74S0P4kqr+QGHmdG15Zk8GUzkzWTGiQjvdACgO/d0r5+3tD/2WGjl2B6hfwES++g4TLWAPaiceL+LSwGXizhUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GERqCj6w; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso2441899f8f.3
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740213674; x=1740818474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaJV665AV3yPzU+JriL5zw7cJhNHTOrH7fZFwrVgwF8=;
        b=GERqCj6wUxFNZDnILMGmuWNVL8671TednHENYKVE0+NuU8eN2CevU/mjhHuScwdexB
         i44A6uCcg6IuqKPAO+MLEPoV6ENKv0fP0UhdpcQDAerw3twrSrdA+h0cOcSb+Fy2ba1R
         FwADUSuMQL5TooHD0WLS2wQXmdOnsu4iva3+XRy139m2M9dhlIkN0RsULC/cETnDCcxd
         6fjwQbnjzUfpW6YX2h15gS5c8vcFNEkIwgj+MYfMhIpNNxVysGvcYOgovKFKfwDwSBUw
         +RC6bfCdmHgBMW59v90lGwj3ZUiTDwmqvng1kVE3RUWI7Ya/KIZVr+B9KbDuQDop3dbG
         +zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740213674; x=1740818474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaJV665AV3yPzU+JriL5zw7cJhNHTOrH7fZFwrVgwF8=;
        b=AzNNqEwFHCOcmYn/oHnmUOS4sEXWiuL6VShxNHl0+QVl58jX0DBx+/De1uOhOhNBP0
         SfkB2Ev1ZjLn3UmgXm/38wHDL7SpTpUQpH8eLBwaLn+A4BmDB/Y9INdYgvyjBoZ2MwGb
         yvRcgytva4sl/PYWGY4HBQUNb/XW6rC+ExypCxrZmTAh4I24vG2wZkUkOjR2NUcTe4TH
         rrrOkJwubWHTUIJ04OR74nRgGcbC5h6gIeLhOCdMb8GlILNgWqqU2jiZymtZvv1rDhWd
         66FZLJDkBUv1XoKXdMvwaNufnrSI08AmCBncihuAgRouiHYtLZOO1uyz5E92YDbuNOf7
         xDCg==
X-Forwarded-Encrypted: i=1; AJvYcCVPkA1wtgs35zttn7HOP8oyoJl39qvBaEsyqk86dcHPE+wnJ7Wn1LZSbkhmLQuIhYnEvAYhXqoK@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5MD17P3ceqSna/yiFHwcvpHjBHkhTjxwjS4d1qE2j0wkatSat
	7KjIFoDsixUFpPUg111KgJ4TMEAuye9k35BCDZL+2Ulb5I6s2I74
X-Gm-Gg: ASbGncsmzJn8lvndM4Vc8G6BdNZqCJb9sx2jFBhOToqbJYy/Sk8ZhAZ4I8XiRMAW1Lx
	zwxe843x8MPCxGCwO8XEu3n82PwC6V4P82BRIdrT1+ojajDld9Fn1bt/Ls2CsXt4L/UAo2F9zyX
	X0hpHLkappGxGQJaW0kfCZedFV+6RZogZ9H3+Rjb2qiBbcM+UA6ilHu/O/eup7sl3rIa57reurg
	lTlTHJDiD3+afy1UtX7XhqDp1USyJDKCH2HVOmVoYj5YxC/4Tc536D2Pgr0adupxKGNrLSlDB9D
	hyuHwavT5dTp9c4INzHqs8Hjf8BGuhaOvAqqyMUsOPBLCZur+Nfvr6LE30epsdy4
X-Google-Smtp-Source: AGHT+IEXdU1fuHO8qIW2d1ilr9ZJTNlJ0Vo8IHgRtK33xwA9gvTMGEqNrn0XDDuoDvlxbx6680O3gA==
X-Received: by 2002:a5d:5888:0:b0:38f:5120:129d with SMTP id ffacd0b85a97d-38f6f0bc676mr4633805f8f.49.1740213673840;
        Sat, 22 Feb 2025 00:41:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b037213dsm40479475e9.40.2025.02.22.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 00:41:13 -0800 (PST)
Date: Sat, 22 Feb 2025 08:41:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Engelhardt
 <ej@inai.de>, "H. Peter Anvin" <hpa@zytor.com>, Greg KH
 <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig
 <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: C aggregate passing (Rust kernel policy)
Message-ID: <20250222084112.23eb2856@pumpkin>
In-Reply-To: <20250222063730.GB11482@1wt.eu>
References: <Z7VKW3eul-kGaIT2@Mac.home>
	<2025021954-flaccid-pucker-f7d9@gregkh>
	<2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
	<2025022052-ferment-vice-a30b@gregkh>
	<9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
	<n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
	<20250221183437.1e2b5b94@pumpkin>
	<CAHk-=wjF0wjD4ko7MgrZ1wBZ9QOrQd_AnyhDDUJQ1L5+i-o22A@mail.gmail.com>
	<20250221214501.11b76aa8@pumpkin>
	<20250222063210.GA11482@1wt.eu>
	<20250222063730.GB11482@1wt.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Feb 2025 07:37:30 +0100
Willy Tarreau <w@1wt.eu> wrote:

...
> Update: I found in my code a comment suggesting that it works when using
> -freg-struct (which is in fact -freg-struct-return) which works both on
> i386 and ARM.

The problem is that you need it to be an __attribute__(()) so it can
be per-function without breaking ABI.

> I just didn't remember about this and couldn't find it when
> looking at gcc docs.

I can never find anything in there either.
And then I wish they say when it was introduced.

	David


