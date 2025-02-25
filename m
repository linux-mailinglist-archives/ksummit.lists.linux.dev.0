Return-Path: <ksummit+bounces-1889-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26268A446D9
	for <lists@lfdr.de>; Tue, 25 Feb 2025 17:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22EB11888B50
	for <lists@lfdr.de>; Tue, 25 Feb 2025 16:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F6E189F39;
	Tue, 25 Feb 2025 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdaSRZBq"
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBB433CB
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501939; cv=none; b=LPTIcswECdvqx1yqNXWscmnZOo0P2STmmO+HexeIovve+2BU2AlqbQKrNyL/n7wAH0UdDsbE+s3uqZFYBYViGgdYybQmmk/Mm3SWjv0Vk+Ka59PyhguN6+dE6iKrO5MNzSXy0uPrt8WjfzRwjATuiqg/RsIq648YOa5PkUAPFWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501939; c=relaxed/simple;
	bh=hwF6kbqLpp3QELXgKHrPeWegET4R6Y1jIN6cmKBZeuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqmzBn7YFv8AjQPofCaMMtbwpnanpKHPZzBvse1/RUEup/AGAXsR7H7kpCxafB1SqVcW1Mtsn1UpyM9Z+hmTMt+V3EAKPyjul3n1Ii5IohYKptexiYYJVBnz0ImMJemXc0rHzupIl+xoEPf0Er9YvApyMCbfGXXAQS6K+XkEfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdaSRZBq; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-30a2594435dso67008831fa.1
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501935; x=1741106735; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7AjPiUKufcUCuCRwM7KdiACvN7KG8NT17WOPwc4KLM=;
        b=BdaSRZBqIGQGUKf0XOfUbkoFuO0UVwCGhrU/iTfZEyow2qNcaiciMdeUjizYIZPn35
         0ifjRs0Jl+QLXwCsoF4IuwX2ggB5BshblHcheejPEYJ61uuS/0H6jPBn0dhRzxOuCgiG
         2MFSg0f4OMFzKHYern1b6K/CbLDuN3BK9+f+gHbxUKsweqeRM1Sa+OaIeE+5bzEHqGE3
         /1dcjmua+BHGfjwljJArzuf/iefE4Th1DfeMygw5C5THASPp4Y6l03xy8j9+T6mr13CK
         QYdeRlWPD7R/iB9kp9t4rtopSozuMVKJcEn2oI34vfunm6ky8BIQDZNOu16qbmyzzO65
         b7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501935; x=1741106735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7AjPiUKufcUCuCRwM7KdiACvN7KG8NT17WOPwc4KLM=;
        b=Z0SETKCCQ7jXK7QSDdLzv3tPiNNISMQkJw1XgXYEbVJSis2HgPnMhkXzfqnwFXpsM4
         vOcsVDjfVXN6WhY8ZQr+jf+hPJwHUPxEQBkTNtjvlaKV/j0duNemDP91aP/+ZPPOO927
         eOA2TBuzudAyiZby0JYwvzLtWI3/TRzJoClK69Yz1AoC4ZE8kPfrwArjj98K+ORAOnCc
         M4FoKjEQQrJZxOZ6Ws3K9qgyceksiKeK8QuXZ1UwYi9QFeJiFYuIRClNi3GR0vv2QbPv
         dMrwJw/GzpFcJS/K6lhoWTnRET+nJCaufwwqThdd6YT3egBmshD9OHrRgooQZZoNtenP
         owzA==
X-Forwarded-Encrypted: i=1; AJvYcCVKcDueaWE1F/n+16Q5MftiJ4hJkIebgePxW+dTpAQhsFssd5IF+9/FhTKdi5S5fEdDpwOc4JAQ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm9D19sMdHJ94/mwGoAScSOdcjNrU1N/E5/uIBGeGQx8Xo9BWu
	Ic5zpy2DboyId1m9gCApVyLYmSOyuX9ZRbTabgNjAjsoPVbPWCJXf08uO8fDEkcAzUMkAV83s2a
	0rqb/hFb+sc+bzJMnQ6wZ4/6XTPw=
X-Gm-Gg: ASbGnctaSb+rbPJnUjqUZvso0pTdLaKCfsj/SCRNdg2w65/q0+bVN7ue+5Ho9hFFAlE
	grxcTaFamfzC4OL6lRiQTNgMOMVt+Nc4P239Gc68sF3ZEP0di+qRIWlMkHGfobHD8jRKdzJk/IB
	zCSgbkOMEM
X-Google-Smtp-Source: AGHT+IGPElTgJGuOIFhoQpvigEoyqAazYmo6oGpLNuo3kczlQ8IZTKJj1630KfSBCVkmPCJZM70leOjvb/aBqpDdaF4=
X-Received: by 2002:a19:641d:0:b0:548:878b:ccb3 with SMTP id
 2adb3069b0e04-548878bd500mr1171731e87.25.1740501934971; Tue, 25 Feb 2025
 08:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRZ1w0ONj2wbcczx2=boXYHoLOd=-ke7tHGBAcifSfPUw@mail.gmail.com>
 <9610C397-39C8-479B-A727-1091BB8548C9@zytor.com>
In-Reply-To: <9610C397-39C8-479B-A727-1091BB8548C9@zytor.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Tue, 25 Feb 2025 09:45:22 -0700
X-Gm-Features: AWEUYZli3Ui7LBmGdvVD9YHbwR1WaUThZgdEiI6e9ZyhcahuU4aeXJ5WC0fMPyI
Message-ID: <CAFJgqgQZoG8VrLUFtCFaMtodvFZEZV-aeFvugCnF+w7WLbS_qQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 8:42=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On February 22, 2025 2:03:48 AM PST, Ventura Jack <venturajack85@gmail.co=
m> wrote:
> >>Gcc used to initialize it all, but as of gcc-15 it apparently says
> >>"Oh, the standard allows this crazy behavior, so we'll do it by
> >default".
> >>
> >>Yeah. People love to talk about "safe C", but compiler people have
> >>actively tried to make C unsafer for decades. The C standards
> >>committee has been complicit. I've ranted about the crazy C alias
> >>rules before.
> >
> >Unsafe Rust actually has way stricter rules for aliasing than C. For you
> >and others who don't like C's aliasing, it may be best to avoid unsafe R=
ust.
>
> From what I was reading in this tree, Rust doesn't actually have any rule=
s at all?!

One way to describe it may be that Rust currently has no full
official rules for aliasing, and no full specification. There are
multiple experimental research models, including stacked
borrows and tree borrows, and work on trying to officially
figure out, model, and specify the rules. Currently, people
loosely and unofficially assume some rules, as I understand
it, often with conservative assumptions of what the rules
are or could be, as Miguel Ojeda discussed. I do not know
if there is any official partial specification of the aliasing
rules, apart from the general Rust documentation.

The unofficial aliasing rules that a Rust compiler
implementation uses, have to be followed when writing
unsafe Rust, otherwise you may get undefined behavior
and memory safety bugs. Some people have argued that
a lack of specification of the aliasing rules for Rust is one
reason why writing unsafe Rust is harder than C, among
other reasons.

A lot of Rust developers use MIRI, but MIRI cannot catch
everything. One version of MIRI explicitly mentions that it
uses stacked borrows as one rule set, and MIRI also
mentions that its stacked borrow rules are still experimental:

    "=3D help: this indicates a potential bug in the program: it
    performed an invalid operation, but the Stacked Borrows
    rules it violated are still experimental

    =3D help: see
    https://github.com/rust-lang/unsafe-code-guidelines/blob/master/wip/sta=
cked-borrows.md
    for further information"

There is only one major compiler for Rust so far, rustc,
and rustc has LLVM as a primary backend. I do not know
the status of rustc's other backends. gccrs is another
compiler for Rust that is a work in progress, Philip
Herron (read also his email in the tree) and others are
working on gccrs as I understand it.

Best, VJ.

