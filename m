Return-Path: <ksummit+bounces-2150-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C68B2AFC8
	for <lists@lfdr.de>; Mon, 18 Aug 2025 19:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42151965A31
	for <lists@lfdr.de>; Mon, 18 Aug 2025 17:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507462D24B8;
	Mon, 18 Aug 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtPoK5ky"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35ED2D249C
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 17:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539620; cv=none; b=Zafd4h/lRrglPPv9o+fxlb9blnfx+tnI4vg/QDm4zafG+6uXV9ttkjyNbipGQgbgC82WTTIprKEimQ8peUjwXrj/+mfyjuDTL6AfXRjETXCZAjZwpZZGDk+dibl+3/N5y/gFUN0cDMiRrxquZwwHvZtFK/NcQMeaSCjRM4311kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539620; c=relaxed/simple;
	bh=VG4pkW8Tk4e9ie2GAeMv6RXt84FNlXGDJA0rbJIXjuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQlSi2HiizPkgo6Ave9VeCzOlr5mt9JY/6bJeBi1b8nWlNjWdCxvGuCxY0Z3noH/OKTKQDRz3DG01ntvwKeHW/940xxXZ7HzIfRfukFzTb7kkCz666gKwVZZtvrm1xXIcmOLwfW0FACqsKCsP3usH3FszMYW0rEbRin4Zc231Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtPoK5ky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586ACC4CEEB
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755539620;
	bh=VG4pkW8Tk4e9ie2GAeMv6RXt84FNlXGDJA0rbJIXjuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WtPoK5kyMqk7oOoWq7UhdgCwDDHElkmNYdXo337+j88f1FPSG4VfItIpqXhXv1I2B
	 NUgLh+AKRL851KKi/lmeC5GATAew12urAbBJi4vJujufoKfJfzCrYgwBvzKn+ZTr33
	 9uJn/2cwvhlEU4mTqzYy/UFsXZh53Xmezzl9Jxkloe9uVZfO4oBJXBta4mVAom6YdY
	 JH3Ve975RzZZf6iHKKZJziF12ccmXiMSRlWBrL00amIe/5mNkneyPMVYL3dCG+4rRo
	 pZTeABTrovXD0neGsAo1+xbLxh8Q0KZI8V/o4Qo8VjRd9lWbSnKX3y3cAvM4vIYTlL
	 USRntRpA6zZcA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-30cceaaecd8so1801307fac.2
        for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 10:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRGJiDuRSiKRfNAsx60jgR78TDDhmMdSbwUmsEQfgcvJ5sVUTPVJCaAjrVeJaADzSjlEJayVEz@lists.linux.dev
X-Gm-Message-State: AOJu0YyIdjKKK1AmawZNqd61Hwngb7JXCAjM/32KKf3Qu2XM8VuHxCPa
	KDnPVW0LjCnKEhCb7LGTQRKdzG063bua/dGTcypeEYMKWyFVPkQTEbXF0ZMctmy6cwDFzoJu5xe
	+81nMRghiekfPI8ydSQB0XTaltEiBDyk=
X-Google-Smtp-Source: AGHT+IE0SX59qPhQVNhGh2f+hmtDCdjIcOGgxNUp3OKctr22Nu8I1zgff1fSVu3a4rx8AQlDVRmm4D6nHEoeZVzB7nU=
X-Received: by 2002:a05:6870:2487:b0:2ea:82c1:47c with SMTP id
 586e51a60fabf-3110a81f64cmr26965fac.2.1755539619636; Mon, 18 Aug 2025
 10:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
In-Reply-To: <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Aug 2025 19:53:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iBLndaGmF=_VHy8bi5F7Ey0Ov+pCtd2Wt9+_uAkW1e-A@mail.gmail.com>
X-Gm-Features: Ac12FXzi8j2ChAF3TiSPLUz2umcTQ81gwu7r6IXIcIxFor0l9OXx5Awb-UP-lDg
Message-ID: <CAJZ5v0iBLndaGmF=_VHy8bi5F7Ey0Ov+pCtd2Wt9+_uAkW1e-A@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted code
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:41=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> > > On 05/08/2025 19:50, Sasha Levin wrote:
> > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > >
> > > > > This is not really about legal aspects of AI-generated code and
> > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > DCO, etc.
> > > > >
> > > > > My concern here is more "human to human", as in "if I need to
> > > > > talk to a human that actually does understand the patch deeply
> > > > > enough, in context, etc .. who is that?"
> > > > >
> > > > > I believe we need to at least settle on (and document) the way
> > > > > how to express in patch (meta)data:
> > > > >
> > > > > - this patch has been assisted by LLM $X
> > > > > - the human understanding the generated code is $Y
> > > > >
> > > > > We might just implicitly assume this to be the first person in
> > > > > the S-O-B chain (which I personally don't think works for all
> > > > > scenarios, you can have multiple people working on it, etc),
> > > > > but even in such case I believe this needs to be clearly
> > > > > documented.
> > > >
> > > > The above isn't really an AI problem though.
> > > >
> > > > We already have folks sending "checkpatch fixes" which only make
> > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > but are completely bogus otherwise.
> > > >
> > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > problem, but tackling just the AI side of it is addressing one of
> > > > the symptoms, not the underlying issue.
> > >
> > > I think there is a important difference in process and in result
> > > between using existing tools, like coccinelle, sparse or even
> > > checkpatch, and AI-assisted coding.
> > >
> > > For the first you still need to write actual code and since you are
> > > writing it, most likely you will compile it. Even if people fix the
> > > warnings, not the problems, they still at least write the code and
> > > thus this filters at least people who never wrote C.
> > >
> > > With AI you do not have to even write it. It will hallucinate,
> > > create some sort of C code and you just send it. No need to compile
> > > it even!
> >
> > Completely agreed, and furthermore, depending on how that AI was
> > trained, those using that AI's output might have some difficulty
> > meeting the requirements of the second portion of clause (a) of
> > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > submit it under the open source license indicated in the file".
>
> Just on the legality of this.  Under US Law, provided the output isn't
> a derivative work (and all the suits over training data have so far
> failed to prove that it is), copyright in an AI created piece of code,
> actually doesn't exist because a non human entity can't legally hold
> copyright of a work.  The US copyright office has actually issued this
> opinion (huge 3 volume report):
>
> https://www.copyright.gov/ai/
>
> But amazingly enough congress has a more succinct summary:
>
> https://www.congress.gov/crs-product/LSB10922
>
> But the bottom line is that pure AI generated code is effectively
> uncopyrightable and therefore public domain which means anyone
> definitely has the right to submit it to the kernel under the DCO.

Well, if it isn't copyrightable, then specicially it cannot be
submitted under the GPLv2 which is required for the kernel, isn't it?

Cheers, Rafael

