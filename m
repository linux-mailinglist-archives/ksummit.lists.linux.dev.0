Return-Path: <ksummit+bounces-2499-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047DBD52A1
	for <lists@lfdr.de>; Mon, 13 Oct 2025 18:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97443E7252
	for <lists@lfdr.de>; Mon, 13 Oct 2025 16:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C03312811;
	Mon, 13 Oct 2025 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLeGV2mN"
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511FA31280A
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370062; cv=none; b=MTRwKSM9N4Fat71ZC6rm+THu1yyCb2Mf+O8Jtes0w6W5DNF6j1Wh9n2yUQtUunWLMX2vIabr9Gn6dxgJvT3gOm+3JApb4ILRS3T30iwFYr+2amNfQrq4pu/pZyGfFA5rxDhhAkSB/Cr7MxEeMo05V75dpIqQbUGsRHv2NwCLhxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370062; c=relaxed/simple;
	bh=SfrUKvyGQyV/RQNHgI1QMF7XEVaF/uWMgeRSjf7U7rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHCrsc3PokwvBarzCRsDQwBkCxaX8m6fDt4GPCftRoomkqNVIE3nW1/GaQGs93MUHHox4Wc5/ukueL1hQJ9G77E3d5IJS+IO7QRUUIcKWcSxEXyKajVdWYn+009ChEIzde6nZtopOZI5h71OF47tmFyGqkkran1HK2mk2qLCm3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FLeGV2mN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so60707305ad.2
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370060; x=1760974860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3naRluSATUMYtvwvGbjzjs4SCK2OlKkV9CXY+WrKtsw=;
        b=FLeGV2mNGpVWbzN8jr5OQQ+pIe2osBVFKpe9BNqkA6gvoQCvppQg8K7SXQDiNznVet
         x6ULS6GexGMWOtN6HcecbhmI1LQqpN2pYTbvKe9wGfctsUKqbjoE74pU2qnyf7WpLUJ+
         ++2oJ3fHAQQO9rKV9ObbA5TpG5ciYNH9JbKxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370060; x=1760974860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3naRluSATUMYtvwvGbjzjs4SCK2OlKkV9CXY+WrKtsw=;
        b=VTTItdviRgkG/0X00jOuRL6vbXjwcwdhph98iV2rg624T1BX7gZImk+DaM7QkYHfD2
         j3lIrnu3wgcTkjeNUsFOwxVyTFwQm6w2RU/u1AuUukcoJ8kNclfFBZgtZz/N2Zb0kzBM
         dabbmCHf82mk1kiAXJnfYJMITHd6a/LyxXMQwaq3Zn/2UXBHpYJArbT1uXHwWJKAHUAF
         brckOpI6NhKNYyLm3jPi8gzCI+yIU0IKVOeMqlmxidnywRP8FK/J7ozt/FnamtVa7J0u
         F0oherj54uyJKtDvaurJXYpltj20LS2AQN/P6i1uwtcsGtvfl2pyedmf32xrS20r+MVN
         XWLA==
X-Gm-Message-State: AOJu0YwgWxXmFdk+o3TZkwl3uHtw+XbKfui1IvwqZ+al8uaSlwUNRMPS
	ohl/8kOE2Jingk1C7naf2x99ARAsArvG/q2IAR75xaKCBNVzKfqSyb0+orvgpV9FtGaNdk3+VxY
	4ALk=
X-Gm-Gg: ASbGncs4kpnNj3lLi6tA4oB0/Jk8MdBfSD+k3hO+uSR3wPQ+Kn+sP3lWOlsNwivO1xY
	m7gvif5gj3AvXe8cjnm3+/KCBZUTrzOGiyHgytTU2PCqCNwBFrIQe4+LYLF13OG67uwIj8os8uf
	QdiBG6xoxsq1XAV2Ei+WezJV/WUcU+ZAaZ4B/M6P8SekW5qqb020uP3Hg1cSIOMleZ2+ftbBEU3
	zZZiOgaqAXcE73dLavQ5Wgp3AeDexp84V0OFuXKI6oO6soxm1OraHkzyfHrtLgVFXlo8l7v/so9
	4OY4Ve6HWmgkOWV8QnnTYbbKH9TGqwkkUXVy69znqZ6EKY0qj87VmNtWCW/4SF29Ste4W+YoLql
	WJyc7waRANOHkIb2OY4AL2EbmFUx6xI4MLVHYLAISCjNHI0n6uokziUeIt7IORQ538PXaAbgDaD
	XNmUNh+oGf2PFuUNRgp1uDgmfaQYDZQA==
X-Google-Smtp-Source: AGHT+IEwHfMdz/8HIZhGt8FDnPt/I70fCcbowUVhGjc5oC/0fVps5c/UOSWmJH26YO0igFVxhdkigg==
X-Received: by 2002:a17:903:2345:b0:24c:da3b:7376 with SMTP id d9443c01a7336-2902726438amr311925315ad.26.1760370059874;
        Mon, 13 Oct 2025 08:40:59 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbcbsm136941555ad.45.2025.10.13.08.40.58
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:40:58 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so60706365ad.2
        for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 08:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id
 d9443c01a7336-2902723d3e5mr299646875ad.18.1760370056018; Mon, 13 Oct 2025
 08:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
In-Reply-To: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 08:40:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
X-Gm-Features: AS18NWCLjrLmIN9lXnnzUWg3f8iX5xKw4k9ElcmEAoHXq5-qk8Wn8uVdEiVA_wI
Message-ID: <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 13, 2025 at 4:53=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> There has been a lot of discussion on the tooling list about how the
> loss of link trailers has updated both tooling and triaging issues.
> Konstantin has proposed a tool to get around this, but while that's in
> development, I propose a discussion about making Link (or some
> alternative tag) into the pointer that would work for everyone.

A few random ideas to throw out there:

1. Could we submit a change to the "git" tool to allow something like
the "Link" tag but hide it from the default settings? I'm thinking
something like how "git" only shows the Author/AuthorDate by default
until you say "--format=3Dfuller" and then it also shows you the
Commit/CommitDate. Then we just tell Linus to keep the setting off and
everyone is happy.

2. Given how "everyone" thinks AI is the best thing ever, could AI
help the patch trackers find the version history of the patch / links
to old versions? So when you click on a Link it takes you someplace
where AI has already found links to all the old patches and perhaps
even summarized the mailing list discussion? Maybe this is a terrible
idea and we'd all get flamed the moment the AI gives some bad info,
but somehow it seemed wrong to not suggest an AI solution in this day
and age. :-P

3. Could folks somehow just stage an intervention and tell Linus that
he's wrong and just has to accept the Link tag that he finds useless?
;-)  (Hi Linus! I'm sure you're not reading this, right?) While I
certainly can't consider my opinion to hold much weight, it sure seems
like quite a few prominent people in the community find the Link tag
very useful and are sad to see it go. Given all the people that find
the tag useful, it kinda feels like it could stay? Even if Linus has a
10:1 or 100:1 vote in the topic, from what I gather keeping the "Link"
tag would still win (assuming people that don't give a crap just
abstain instead of voting "no"). Not that this is a democracy or
anything...


-Doug

