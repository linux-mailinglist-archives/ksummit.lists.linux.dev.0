Return-Path: <ksummit+bounces-2528-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025EBDB3E4
	for <lists@lfdr.de>; Tue, 14 Oct 2025 22:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3A014EF3D5
	for <lists@lfdr.de>; Tue, 14 Oct 2025 20:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1EF3064AB;
	Tue, 14 Oct 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cFigTDJc"
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFC306489
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760473456; cv=none; b=C+41JWAwULEPCylEqZZW3FfbZEC/KjbTvGVbZ37pz2RhdSVGvB+HLGV9mu6iQSUK/KdkZVQJUExCD/2aZdBAalYXE3oJAk4nkXo4U+Dg0wbd+7WDFHwggNdANndKdQHXqeFcfY44YNUQyKThXPrQs72L/SMJ6OUkdURkAUz9wFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760473456; c=relaxed/simple;
	bh=5cWV/Z5jB3R1cRGZa58ONppoYz5LtB7MVC4KIy3BoQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEAbVmIlu8jqsQSSaX+V4TKMMo5V3XX/2zfJirE1k9pcZkG6BCVlOiQpal9ZmBaCjm5VwRIErdceOjUI6qWsxFHbueY6U2oAzj7N3oqspA6HlkG9u9rPQvufsDeLpocUHxXXLQNu+lm+YpZwj2uA8stRaYTqLYQ1X0ZYyvJM7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cFigTDJc; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b554bb615dcso4008098a12.1
        for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760473453; x=1761078253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cWV/Z5jB3R1cRGZa58ONppoYz5LtB7MVC4KIy3BoQI=;
        b=cFigTDJc9dljXRqGDs33IBT4gNzP48rmkzbnhjxHAGknYQzO/6pdRUYDwJU/o+SjAB
         ACrUYrjVPvJaNlpj4EaWriHGw6Um73ChFKBxGzI814bvjwvtFrb+bk6CbGCqoZQtpYyv
         57z1zihXopX/7Bhs/cPfxhmd9f5UyfyB7xkCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760473453; x=1761078253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cWV/Z5jB3R1cRGZa58ONppoYz5LtB7MVC4KIy3BoQI=;
        b=Xij3uG/FG0/oqsvIii1PriBVPVIhzDJkcMITDDRI09E5K3WbRdYn7DXfTCeraGtEJD
         blzpprN/jpIk/g1kIi21vNnEWm9NAkfgJrorWJoN0Y2sJ0EHH3C4kuB1qEx/kPlxye37
         t0DQEYuv9T7o5Kinrr+PEHXpFJDa3ZjD9JPXB7KW/i0Gg9UqBG97Y0Z/AYY/tVqrs5qE
         lBdD8B/N4NOESL3Cia7jFrM4cGOIXzYj7RyPUQ9UaEQP63UJj9aOFrcEY6Thsqa9E9ew
         IKz2Vj+TRPtZi9Fn0TAgbp6WKZBPWoWv9FC6xSk2SaJCHGibfTji9vj4fZO5CYNIngDK
         LHtg==
X-Forwarded-Encrypted: i=1; AJvYcCWoSN0dV91Pw7C0+jn28i4O6ylWwp9DIbkEMlwYMi4p/dQC8UarOfBCIZQZG4hZdz1Tkzm21RaN@lists.linux.dev
X-Gm-Message-State: AOJu0YwERkQNktCnPnpSKDnOjhF5HZdn7fNKu6khi4zQA0A4vC1c6n+2
	rGIQP900nu59mFtNOzYyjrDdXMMI12RYn2A8VasRiL0W3rguGiSmmGu4++5Yc+U96dyXQ43Fm6C
	bYyA=
X-Gm-Gg: ASbGncv1os2P/SBaTdq2FcbDlUiWBvQnUEj1vK1RHEPXK1ez/ZEwZMXv+njxErcMTwe
	ud39fJ3321ZordXOJyFeaHIUltKkIzcp5+M4wtptudn0UdCowU4vCT8wzMWfyu4pdvt75vLikdZ
	hrI3fBGk3d9uHuz/csSe7sXIbOjAyEU/Q82jjo38xg5Ib+CoRV+8woywkPgjSSwDfrXs/WCFq/f
	UwxnEu0kAD+Zz797ogHubmPPBZIlOHKS9CFoG1Ebhq4wMz9QC5s/bZO/82tXsqAb5MwU6UgxPTC
	z/Z6dQBp+EJqmnEV5h4PeV/gnUsNNVNO8B6JNXNelUtKVCIFyVZprmMwmAORikL468INVfEgx68
	xJFLmR83hah2kdnzBUh8fSL1/HcAbgSnoM5oz/FWXC0SGYKriCAG9SWJeQ2n2D5xrsyTXwkK3tf
	/cYjXD512xK4v17lJVh74=
X-Google-Smtp-Source: AGHT+IEc5QldwzzL8BetXmwQarTNhluOtZHBWY7N7aV0EpgJKunlI4UIrRJjICfbnqjKwlptr4d/7w==
X-Received: by 2002:a17:902:dac2:b0:290:273f:1073 with SMTP id d9443c01a7336-290273f12a2mr362967575ad.20.1760473453145;
        Tue, 14 Oct 2025 13:24:13 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08de5sm174028555ad.83.2025.10.14.13.24.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 13:24:11 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d2c35c459so41250915ad.0
        for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 13:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIcMSk7C9LLmq6A5bCCgcpDuHJ3P0ZjM3I+F2I8BplltUUy/mrDkRkkjB84Ow8HsRlaK0IEpk5@lists.linux.dev
X-Received: by 2002:a17:903:440f:b0:290:5601:9d56 with SMTP id
 d9443c01a7336-29056019f53mr171601375ad.46.1760473451010; Tue, 14 Oct 2025
 13:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com> <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
In-Reply-To: <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Oct 2025 13:23:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WDi_Wq0pjLrgxCsmAtryJ2VFZUKdqCkFgmBW5bkk6sQg@mail.gmail.com>
X-Gm-Features: AS18NWBuoSElN3u5buSosa6mBtYLWaI_y0Gx-UIfHjC_5m37xvutJet-a3TEtnc
Message-ID: <CAD=FV=WDi_Wq0pjLrgxCsmAtryJ2VFZUKdqCkFgmBW5bkk6sQg@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 14, 2025 at 12:13=E2=80=AFPM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> And we're taking it away because literally *one* person thinks that it
> adds irrelevant noise.
>
> [1] Sure, they can use 'b4 dig' if you pretend they all already know to
> use it.
>
> </rant>
>
> But seriously, why is this such a big thing? Linus is, in general,
> asking literally everyone else much much more to suit his ways in the
> kernel than "don't click the link if it starts with patch.msgid.link"

Right. I think this is why it bothers me so much. There are so many
people that are so passionate about wanting to keep the existing
"Link:" tag usage. ...and these are senior people who have been
contributing for years. "b4 dig" is nice and I'm happy it's being
created, but it still seems like it's not as good at some workflows
and adds needless imprecision/heuristics/AI when a "Link:" tag would
be precise.

It seems weird to discount all the senior people who find the existing
use of the "Link:" tag valuable when those that don't find it valuable
could just ignore it. "Doctor, it pains me when I click on the Link
tag, what should I do?" Answer: don't click on the "Link:" tag.

-Doug

