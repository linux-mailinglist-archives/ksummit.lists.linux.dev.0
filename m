Return-Path: <ksummit+bounces-1776-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E2A3E8B9
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB75570238E
	for <lists@lfdr.de>; Thu, 20 Feb 2025 23:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C333A267AEE;
	Thu, 20 Feb 2025 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K84tGFBB"
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402D26463B
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 23:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094981; cv=none; b=pW+wVXyhcGYWcoLNQkRCI3c7aR4z4NV0s1LHhrRNaR4OwE8LF8DjttRc4fs/0YrzHRqR+hgx8H6MRiNXxcx9wwTh6uvoPk3N1XAa5xFHqlJZfc24LlR1uYP2xhhQOAv7unw56rdJJEFICYZA/FZcp1uzuIdVqc6b1kj1QRAeQOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094981; c=relaxed/simple;
	bh=L9Kfv39OqMdK04JAvpnAP/aGdKTvCtAtW1r4CuukpX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLg34HRv29RjA8aAWn3CystrnD+tmZ78xTSMDtHE+Ha4PqmMc3/KOlTNdQwvcnSYfbd1eoGK/7GBhVwyV02ofT+4Ng8MRbYWrEMkLeE8/xEWjXsh79bGqYei4FTobFYuA9a8zGzs4Dw7KBxWWXwTkwqjqiTdInE93OXUDgnM2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K84tGFBB; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fbfa7100b0so352862a91.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 15:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740094979; x=1740699779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5b1NzyX3+oox2Z612BXoXTkh4jjxT+fedPYrwEqKHs=;
        b=K84tGFBBqwyjmpsYA8+HA8oacCnZjZ5hI75pAQt+r0+fpH1pstYnF9h1ZHQZMQmbcu
         nIzjiYQ4ViyrSx8pVu361UVWE7WjveahSJplOMzn5Dg+G5fNsdVjQaMU0YfhFfbG+lU1
         leyrXnn50+OLgrcGEJfrJTo+fthrMGaZgmliW31kzUSXNPCOyhQb7nnRwcVnDl+kAvx4
         rwL+n/CXqrREiTglvSJ2nMbnkv7ID+6FvLYCT4biVxN8tWSgBZ8zu9LIdv9x1uUrclsf
         fqmXsk15r3q66BdbcAYURS8cR4uE0uDftg7Oge9FCxS5XShYjswufzNz6qOrlMuxF/yg
         /LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740094979; x=1740699779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5b1NzyX3+oox2Z612BXoXTkh4jjxT+fedPYrwEqKHs=;
        b=Cz3qzyWBcSAazr5LuHbUCowXzQuUL/nPDfv5RtslBpRrM5GZ3W71JRhGQH6qCb2DkQ
         /j0HY1CdvqD1A5kVbW4VvyEid1kohLdy+L863Sumc91efgTp2MHiNEwKacDRgdsVL7A8
         oXlk/DsbIi6OxQHiXI9FAEn/hpY4cIA/U4rT4JiEdsDa7an0BtuH1bpTzXHhdGvMXy9n
         sz8DI/k45URQmKb7aemz/RqazXlURLAaqE+B7tzfL3FGla0gl3PEpKSzSpMmROUUk0ek
         KMJPXgVd49fzoNEX0ULIAzQjQb8eqWLSOpxGDbMa9ftV5dig1Ss22pP5Znwg2DiZBzQu
         5uHg==
X-Forwarded-Encrypted: i=1; AJvYcCUlfltY9zsqsT7eimWCEk7iOd/Q9yfcJLy+aZEjEFEBRYi+rNOnZ3CXs3c7MPJbpvqqehyql1sM@lists.linux.dev
X-Gm-Message-State: AOJu0YyljcwJZRJyKgF2yd/PNr4se0bjXNg3yCuK1+IrYYbAYucFV6h4
	QR9izb9dZCfZfTpWnFoRQO1M4vT7yASjlTboxWXqlmyBpP1kwtr5bRfXD1ePysGL1JDi2o+kIHO
	S0czmbQ7evGvOZBYfewlwGKgQp4k=
X-Gm-Gg: ASbGnctgsKQavG5MleYburFnVQvnL0+TcbvygWJ16A4txfdUEd4bDtUW0yBqjIkgMMB
	TnrY0jb4vbC9rYE0E40+E02NWjouyOiVZ6tHJZmzIQQpzZVA6hRF/P24/Sg/L4MeRD6VJYOPL
X-Google-Smtp-Source: AGHT+IEtCMpnIDRlzFsG9k/RqkGrAj4G+X5WTvM7CByob/VUnkpeDuMCZryW/Ycbbb+88dEP0P003NDE1Gqlq/IN4c0=
X-Received: by 2002:a17:90b:350c:b0:2ee:e518:c1d4 with SMTP id
 98e67ed59e1d1-2fce77a63cfmr691014a91.1.1740094979099; Thu, 20 Feb 2025
 15:42:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <202502191026.8B6FD47A1@keescook> <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>
In-Reply-To: <785A9F60-F687-41DE-A116-34E37F5B407A@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Feb 2025 00:42:46 +0100
X-Gm-Features: AWEUYZlZLMmtDWCJImDa9xtbg37S_H3ahSaDF1pmiS0wc6kjTHtRiPI08i7w7u4
Message-ID: <CANiq72nwouotAqJh_cm=9RG3Ns4wxX0LWXcVwp_bswE29kCrYA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 8:34=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> a. The apparent vast gap in maturity required of Rust versus C. What is o=
ur maturity policy going to be? Otherwise we are putting a lot of burden on=
 C maintainers which is effectively wasted of the kernel configuration pull=
s in even one line of Rust.
>
> This is particularly toxic given the "no parallel code" claimed in this p=
olicy document (which really needs references if it is to be taken seriousl=
y; as written, it looks like a specific opinion.)

There is no "no parallel code" in the document, and I would like a
clarification on what you mean by "toxic" here.

I tried really hard to avoid misrepresenting anything, and the
document explicitly mentions at the top that this is our
understanding, and that the policy could change depending on what key
maintainers and the community discuss. (If it is put into the kernel
tree, then that solves that.).

Anyway, I can only guess you are referring to the "Are duplicated
C/Rust drivers allowed?" point. If so, since you want references, here
is one:

    No, don't do that, it's horrid and we have been down that road in the
    past and we don't want to do it again.  One driver per device please.

    https://lore.kernel.org/rust-for-linux/2023091349-hazelnut-espionage-4f=
2b@gregkh/

Things evolved after those discussions, which is why I ended up
writing the "Rust reference drivers" framework that got later used for
PHY:

    https://rust-for-linux.com/rust-reference-drivers

I hope that helps the document "to be taken seriously".

Cheers,
Miguel

