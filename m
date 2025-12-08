Return-Path: <ksummit+bounces-2661-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA7CAC874
	for <lists@lfdr.de>; Mon, 08 Dec 2025 09:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E997303C9AC
	for <lists@lfdr.de>; Mon,  8 Dec 2025 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F53B2DE711;
	Mon,  8 Dec 2025 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZrCnVWj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA812DE6FC
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183283; cv=none; b=nY4sSjmNy/qmOgoWhu61yvEcJWMaqePVfuzMToUpmLHoOCTi/zrNJC7TGJyfsL5K10XN69Wui6rCdEowAhtJIMirG5PDkO0jVUZH7h9i+eb4aasPYih88c1sg4/jMTasdRb5DM+RthdBmCYXyD6sT+Oko/O71CdWI5UB+EdZZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183283; c=relaxed/simple;
	bh=hO/mzbidW2kxBHutaqFB2WdomlwJH/Qdsif7+dkY+Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZKOMet3kk+6+I11TmXGmXmvy7DcdmFSPiFa5DjyRzokk8apaTfDpMVZrrxaVG0EcVoLMo8d8gYIM0O1ZuNd0F/NXYM/kMRZ3ek0QMEC5LbK8CeYXAlOtWKkcmq/F7oWog3Dp5H9lObq981hib+Sadm91S9HfDXuwmVqPEOp0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZrCnVWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107F9C16AAE;
	Mon,  8 Dec 2025 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765183282;
	bh=hO/mzbidW2kxBHutaqFB2WdomlwJH/Qdsif7+dkY+Ng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JZrCnVWje1VLA7aqhU27mdm5iqNaFlpZ1ngCpS5EAZCGXNSb0MtT0z3HaWtnqbcui
	 zdDpZmp71TXqPqyCBVillW03IIopSGWR9U0ElkmQuK2+A6J6dMdAHKk5JpRATRAssC
	 jmthwXPSbLV/D2FWOgTdN3thmtzd+cuyDz0uzkfjpGVT3HZ+A3SILpF2p/PBuduBhs
	 vote/yajFc+NANwb1qj82BzzE4HXcOlVTNo9ZjMUx+EdID6xx/mE9AcI/wZhGJ4Q+P
	 dSHzKAuPhrvDIr0Ujw3l4XgEiqYNp+LwApCeT6YkPSR6JQ7u8Duu8idKobZSP0uIWK
	 zsg3X5+aQbKAg==
Date: Mon, 8 Dec 2025 09:41:16 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20251208094116.6757ddeb@foz.lan>
In-Reply-To: <88091c9ac1d8f20bade177212445a60c752ba8b5.camel@HansenPartnership.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<aTYmE53i3FJ_lJH2@laps>
	<4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
	<87zf7tg2dk.fsf@trenco.lwn.net>
	<20251207221532.4d8747f5@debian>
	<88091c9ac1d8f20bade177212445a60c752ba8b5.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 08 Dec 2025 12:42:32 +0900
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> On Sun, 2025-12-07 at 22:15 -0500, Steven Rostedt wrote:
> > On Sun, 07 Dec 2025 18:59:19 -0700
> > Jonathan Corbet <corbet@lwn.net> wrote:
> >  =20
> > > > I contend there is a huge difference between *code* and
> > > > descriptions/documentation/... =20
> >  =20
> > >=20
> > > As you might imagine, I'm not fully on board with that.=C2=A0 Code is
> > > assumed plagiarized, but text is not?=C2=A0 Subtly wrong documentation
> > > is OK?
> > >=20
> > > I think our documentation requires just as much care as our code
> > > does. =20
> >=20
> > I assumed what hpa was mentioning about documentation, may be either
> > translation of original text of the submitter, or AI looking at the
> > code that was created and created a change log. In either case, the
> > text was generated from the input of the author =20
>=20
> I think this is precisely the problem Jon was referring to: you're
> saying that if AI generates *text* based on input prompts it's not a
> copyright problem, but if AI generates *code* based on input prompts,
> it is.  As simply a neural net operational issue *both* input to output
> sets are generated in the same way by the AI process and would have the
> same legal probability of being copyright problems.  i.e. if the first
> likely isn't a copyright problem, the second likely isn't as well (and
> vice versa).

I'd say that there are different things placed in the same box. Those
two, for example sound OK on my eyes:

- translations - either for documentation of for the code.
  The original copyrights maintain on any translations. This is already
  proofed in courts: if one translates Isaac Asimov's "Foundation" to=20
  Greek, his copyright remains at the translation. Ok, if the translation
  is done by a human, he can claim additional copyrights for the
  translation, but a machine doesn't have legal rights to claim for
  copyrights. Plus, the translation is a derivative work of the original
  text, so, I can't see how this could ever be a problem, if the
  copyrights of the original author is placed at the translation;

- code filling - if a prompt requests to automate a repetitive task,
  like creating a skeleton code, adding includes, review coding style
  and other brute force "brainless" activities, the generated code won't
  be different than what other similar tools of what the developer would
  do - AI is simply a tool to speedup it, just like any other similar
  tools. No copyright issues.

Things could be in gray area if one uses AI to write a patch from the
scratch. Still, if the training data is big enough, the weights at the
neuron network will be calibrated to repeat the most common patterns,=20
so the code would probably be similar to what most developers would do.

On some experiments I did myself, that's what it happened: the generated
code wasn't much different than what a junior student with C knowledge would
write, with about the same mistakes. The only thing is that, instead of
taking weeks, the code materialized in seconds. To be something that
a maintainer would pick, a senior developer would be required to cleanup
the mess.

> > . Where as AI generated code likely comes from somebody else's code.
> > Perhaps AI was trained on somebody else's text, but the output will
> > likely not be a derivative of it as the input is still original. =20
>=20
> That's an incorrect statement: if the output is a derivative of the
> training (which is a big if given the current state of the legal
> landscape) and the training set was copyrighted, then even a translated
> text using that training data will pick up the copyright violation
> regardless of input prompting.

If one trains it only with internal code from an specific original=20
product that won't have any common patterns which anyone else would
do, then this could be the case.

However, this is usually not the case: models are trained with big
data from lots of different developers and projects. As Neural networks
training is based on settings up weights based on inputs/outputs, if the
training data is big enough, such weights will tend to follow the most
repetitive patterns from similar code/text.=20

On other words, AI training will generate a model that tends to repeat
sequences with the most common patterns from its training data. This
is not different than what a programming student would do without
using AI when facing a programming issue: he would likely search
for it on a browser. The search engine algorithms from search
providers are already showing results with the more likely answers
for such question on the top.

The AI generated code won't be much different than that, except that,
instead of taking just the first search result, it would use
a mix of the top search results for the same prompt to produce its
result.

In any case (googling or using AI), the tool-produced code examples
aren't ready for submission. It can be just the beginning of some code=20
that will require usually lots of work to be something that could be=20
ready for submission - or even - it can be an example of what one should
not do. In the latter case, the developer would need to google again or
to change the prompt, until it gets something that might be applicable
to the real use case.

Thanks,
Mauro

