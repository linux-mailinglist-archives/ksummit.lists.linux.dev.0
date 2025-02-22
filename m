Return-Path: <ksummit+bounces-1830-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC7A40836
	for <lists@lfdr.de>; Sat, 22 Feb 2025 13:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F407B424FE1
	for <lists@lfdr.de>; Sat, 22 Feb 2025 12:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E18B20AF97;
	Sat, 22 Feb 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAU6q7Is"
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794B20A5D1
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740226261; cv=none; b=YpVxsOOBQuqqsrn+FbyAlu47lyu7IHy1F26B6aDDYIjXzsL8Lg5pS9kE69L4g0P1ty4sf00cK65R9/QTHG73ofTSBz0sshREiXUjJg3BZvU5YWoUoSUBD3//HroXoUZJYCszfny6AmEPSSrINoU/6iSKPuUyv87qS8YSilLDN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740226261; c=relaxed/simple;
	bh=SZy0xopn3nNoC4+o7RLbVH/J4D8+Z7HpgAFVWjnu+uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=quCWCm5B3GrG7bJ0Ng5bdgZKbWS0Hj8SUU3tvegYniCSP4LD5Pst0COCs1phA4BxVvAXiXPzB8jB7QtFDzBWVRXiLxblWKu+6OCvLapPokfNrvyUX74LJmUFO/340aKkvvASBaz6AZeubfLRcLbnPSvAHeWvyyfNkcWSUuSSCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAU6q7Is; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fd02536660so139985a91.2
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740226260; x=1740831060; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZy0xopn3nNoC4+o7RLbVH/J4D8+Z7HpgAFVWjnu+uk=;
        b=VAU6q7Isz8F88x381JnEsiPwPRIcwW2H7tc5Yqu8FPKnAchRfwpPpGWdkAZZkxYbNa
         fgUDp9Q72D4tzafXeBdce61K0J4qp6A4bf/CSCa+MCz3JfdsW4qr3YUtJCHBR2cynLkV
         9xzV6/LrDc9mhh9KHK/lwsr0Uix3XnsoxOf7xtPSeiAoxe23Rcw2lmofXO1ZCGpNvoCB
         FtMmNxVoBJUOuBlw2rgZM9XhzEL1HbDPvcfso1KBcbA2TgVw3zzGTPHguWo5+M7dvhMx
         9R/zAqtZ8xV3LPkAjDzfQkbMRlMU6TboXmH3hWr3QyAWpg51f/HoUqX1EbU9VtcWistb
         gfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740226260; x=1740831060;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZy0xopn3nNoC4+o7RLbVH/J4D8+Z7HpgAFVWjnu+uk=;
        b=qKoCj0w6x2LBFtvcUH9bKmJ8VZTrw5rb5jWmMG8EsrT54QTp6PO4nXJkKUlUHW+d7y
         sqL/p4KTqH/kMR41H8Qd4UOVaPe6Us26Km0XBFGTXYbPLN+RyItBQqjK62e5p7KNRX1G
         FQ4oVIuQP65E4Ix4lxJ937RC/Q8jFzCiqUBse83gI1H/j489gqIMIy6vgdD5HpGuZlfV
         BV36M6vP6MQ7IayWewEnrcjEiDd9RAAIpWW1yjjME3EtZi/F2KPYFlZZixfaF9tvUDvr
         MndQ7lNZ7oWqBpFtKgEp5mSLS/3G36fqzX/faqH43QygXLC5xG5VsRQ+h1eK/jDSWZJc
         EUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUHwX0Eb4YGC0ofVGVrm0jQ9aPBAO9hTxAranfFE/sTo0uFN4CV9RAcr2QnuUYe7Duh6Rsbl5xh@lists.linux.dev
X-Gm-Message-State: AOJu0YxnTnpFsv2diWufCpfcBg8dq4/VY7lt9QNKvyW1FExqs8LBbAdn
	vAeB6wQjkBC/Li3Lu2wFwHk+vBQZox30JCEoq3Zl/9tBshqxKMrJ0+36OL+4DctH/UJtpOLlM7q
	WC047uJyyAd1oeF4xNVagEakc8PY=
X-Gm-Gg: ASbGncueU6ruP/ITTk7idcjbaJ6J+kqcIpP61/vx+EV3nLh7lChGx+kf+kJ0IOSaEo5
	vUcDmmfxFX2sUnJcYesJHeiUQrzw1jopa7Ez50fOIXVSGlah70ddQEGcppMQ0eCgv+sH/whqpik
	NnCb40Tcs=
X-Google-Smtp-Source: AGHT+IF9fR0qN75T1FT/vAtusAgCeHsxt0QeV7LUuUFzgPjYSOusqdHL4N/moUgnq2JAScG201nrc8w+bXPCElr7+tM=
X-Received: by 2002:a17:90b:3805:b0:2fc:1845:9f68 with SMTP id
 98e67ed59e1d1-2fce7b3a743mr4113663a91.6.1740226259695; Sat, 22 Feb 2025
 04:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org> <CANiq72mM3tVmT6MQZqpzGEW4hJABVHRiODL0SnP2u+0ES4=pjw@mail.gmail.com>
 <Z7iav4U7k9AJDzay@phenom.ffwll.local>
In-Reply-To: <Z7iav4U7k9AJDzay@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 13:10:47 +0100
X-Gm-Features: AWEUYZmKIXtsS9XyYsnP9W5G6wLA8n8QI4zzDurGyHbuUnb-4n_nqydQW0zhjlY
Message-ID: <CANiq72n5v7wS_YKCegdZ2tU1EapASr10SrR3+Ef3ZypUR8XBQA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:24=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> Disregarding the specific discussion here, but this just felt like a good
> place to thank you for your work to bring rust to linux. Your calm and
> understanding approach to figure out what fits best in each case, from "g=
o
> away, don't bother me with rust" through "I like this, but I have no clue=
"
> all the way to "uh so we have four drivers now in progress, this is
> getting messy" has and continues to enormously help in making this all a
> success.
>
> Thank you!
>
> Obviously not diminishing everyone else's work here, just that Miguel's
> effort on the culture and people impact of r4l stands out to me.

Thanks for the kind words Sima, I appreciate them.

Others are definitely the ones doing the bulk of the hard technical
work (i.e. the safe Rust abstractions).

Cheers,
Miguel

