Return-Path: <ksummit+bounces-2662-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F4CACA12
	for <lists@lfdr.de>; Mon, 08 Dec 2025 10:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E85113013567
	for <lists@lfdr.de>; Mon,  8 Dec 2025 09:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212942C3259;
	Mon,  8 Dec 2025 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="tkFALgwF"
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDE15A85A
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185420; cv=none; b=tyx0BBku1Ah2arRnEiDQpR4wuiHZgr5dQY8xcd3ys9IaesGGG+NeJHweclLWpEfbc0au+2vuYfWjD6Do8U2bstL9aAStaIW2StLX8/7TS1q/KyFjmPwUxcn15540TzoaqhhaULGQ4uvyA81fdn9H9vqOZCjraRYhZrM2R8fay1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185420; c=relaxed/simple;
	bh=SYlPHKdg88J8r8XTTTCESJaW58eqNDhr/6tr+7uUpXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2QmuO49lie0RJUUhRfzlR0aHhT9YQDEX6FRQqPlJd8m9OiVT47Arf03s/YjRlVBeHONG0680Ad+rE1PFCIdzPBXTeFBrm+5mgCO19WeWNI+rlslJW5M5hrgpdhIlUdjNC2ha7o7r4vQi5plLjI60XyKklvINeaKquBwmJySO1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=tkFALgwF; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1765185416;
	bh=SYlPHKdg88J8r8XTTTCESJaW58eqNDhr/6tr+7uUpXo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=tkFALgwFYgTrmpRwdJrjt3q6LM/4kvzR3VaTkZH/awzRIrfKBRAzd+CehRB4pgX8I
	 ETLyi4JzS2Wji1oOx2zALjWW14OtjBzvXY8x9+q3W2r1uqMv5FyUGtCtyZ86Ty8A4N
	 ky5k+hNz8gTL8gQiCdO3XIFG0hHKY0AWz6Tful9E=
Received: from [172.20.4.117] (122x212x32x58.ap122.ftth.ucom.ne.jp [122.212.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 72E2E1C015F;
	Mon, 08 Dec 2025 04:16:55 -0500 (EST)
Message-ID: <4597dfe45c9ff2991ed5221c618602ea42993940.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	"H. Peter Anvin"
	 <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Date: Mon, 08 Dec 2025 18:16:52 +0900
In-Reply-To: <20251208094116.6757ddeb@foz.lan>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	 <aTYmE53i3FJ_lJH2@laps> <4BDD9351-E58A-4951-9953-00F1E9F24FB4@zytor.com>
	 <87zf7tg2dk.fsf@trenco.lwn.net> <20251207221532.4d8747f5@debian>
	 <88091c9ac1d8f20bade177212445a60c752ba8b5.camel@HansenPartnership.com>
	 <20251208094116.6757ddeb@foz.lan>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-12-08 at 09:41 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 08 Dec 2025 12:42:32 +0900
> James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:
>=20
> > On Sun, 2025-12-07 at 22:15 -0500, Steven Rostedt wrote:
> > > On Sun, 07 Dec 2025 18:59:19 -0700
> > > Jonathan Corbet <corbet@lwn.net> wrote:
> > > =C2=A0=20
> > > > > I contend there is a huge difference between *code* and
> > > > > descriptions/documentation/...=C2=A0=20
> > > =C2=A0=20
> > > >=20
> > > > As you might imagine, I'm not fully on board with that.=C2=A0 Code
> > > > is assumed plagiarized, but text is not?=C2=A0 Subtly wrong
> > > > documentation is OK?
> > > >=20
> > > > I think our documentation requires just as much care as our
> > > > code does.=C2=A0=20
> > >=20
> > > I assumed what hpa was mentioning about documentation, may be
> > > either translation of original text of the submitter, or AI
> > > looking at the code that was created and created a change log. In
> > > either case, the text was generated from the input of the author=C2=
=A0
> >=20
> > I think this is precisely the problem Jon was referring to: you're
> > saying that if AI generates *text* based on input prompts it's not
> > a copyright problem, but if AI generates *code* based on input
> > prompts, it is.=C2=A0 As simply a neural net operational issue *both*
> > input to output sets are generated in the same way by the AI
> > process and would have the same legal probability of being
> > copyright problems.=C2=A0 i.e. if the first likely isn't a copyright
> > problem, the second likely isn't as well (and vice versa).
>=20
> I'd say that there are different things placed in the same box. Those
> two, for example sound OK on my eyes:
>=20
> - translations - either for documentation of for the code.
> =C2=A0 The original copyrights maintain on any translations. This is
> already
> =C2=A0 proofed in courts: if one translates Isaac Asimov's "Foundation" t=
o
> =C2=A0 Greek, his copyright remains at the translation. Ok, if the
> translation
> =C2=A0 is done by a human, he can claim additional copyrights for the
> =C2=A0 translation, but a machine doesn't have legal rights to claim for
> =C2=A0 copyrights. Plus, the translation is a derivative work of the
> original
> =C2=A0 text, so, I can't see how this could ever be a problem, if the
> =C2=A0 copyrights of the original author is placed at the translation;

I can explain simply how I as a translator could cause a copyright
problem with no AI involvement: let's say I translate Foundation from
English to French but while doing so I embed a load of quotes from the
novels of Annie Ernaux but in a way that it nicely matches the Azimov
original.  Now I've created a work which may be derivative of
Foundation and partly owned by me but which also has claims of
copyright abuse from Annie Ernaux.

The above is directly analogous to what would happen if the AI output
were decided to be a derivative of its training for an AI translator.

> - code filling - if a prompt requests to automate a repetitive task,
> =C2=A0 like creating a skeleton code, adding includes, review coding styl=
e
> =C2=A0 and other brute force "brainless" activities, the generated code
> won't
> =C2=A0 be different than what other similar tools of what the developer
> would
> =C2=A0 do - AI is simply a tool to speedup it, just like any other simila=
r
> =C2=A0 tools. No copyright issues.
>=20
> Things could be in gray area if one uses AI to write a patch from the
> scratch. Still, if the training data is big enough, the weights at
> the neuron network will be calibrated to repeat the most common
> patterns, so the code would probably be similar to what most
> developers would do.
>
>=20
> On some experiments I did myself, that's what it happened: the
> generated code wasn't much different than what a junior student with
> C knowledge would write, with about the same mistakes. The only thing
> is that, instead of taking weeks, the code materialized in seconds.
> To be something that a maintainer would pick, a senior developer
> would be required to cleanup the mess.

How good (or not) AI is at coding is different from the question of
whether the output has its copyright contaminated by the training data.
>=20
> > > . Where as AI generated code likely comes from somebody else's
> > > code. Perhaps AI was trained on somebody else's text, but the
> > > output will likely not be a derivative of it as the input is
> > > still original.=C2=A0
> >=20
> > That's an incorrect statement: if the output is a derivative of the
> > training (which is a big if given the current state of the legal
> > landscape) and the training set was copyrighted, then even a
> > translated text using that training data will pick up the copyright
> > violation regardless of input prompting.
>=20
> If one trains it only with internal code from an specific original=20
> product that won't have any common patterns which anyone else would
> do, then this could be the case.
>=20
> However, this is usually not the case: models are trained with big
> data from lots of different developers and projects. As Neural
> networks training is based on settings up weights based on
> inputs/outputs, if the training data is big enough, such weights will
> tend to follow the most repetitive patterns from similar code/text.=20
>=20
> On other words, AI training will generate a model that tends to
> repeat sequences with the most common patterns from its training
> data. This is not different than what a programming student would do
> without using AI when facing a programming issue: he would likely
> search for it on a browser. The search engine algorithms from search
> providers are already showing results with the more likely answers
> for such question on the top.

Patterns are not expression in the copyright sense.  Indeed, code tends
to be much more amenable to the independent invention defence than
literature: If I give the same programming task to a set of engineers
with the same CS training, most of them would come up with pretty
identical programs even if they don't collaborate.  However, as long as
they didn't copy from each other the programs they come up with are
separate works even if they're very similar in expression.

Just because code is more likely to be independently invented than
literature doesn't make it more prone to copyright violations (although
it does give more scope to the litigious to claim this).

Regards,

James

> The AI generated code won't be much different than that, except that,
> instead of taking just the first search result, it would use
> a mix of the top search results for the same prompt to produce its
> result.
>=20
> In any case (googling or using AI), the tool-produced code examples
> aren't ready for submission. It can be just the beginning of some
> code that will require usually lots of work to be something that
> could be ready for submission - or even - it can be an example of
> what one should not do. In the latter case, the developer would need
> to google again or to change the prompt, until it gets something that
> might be applicable to the real use case.
>=20
> Thanks,
> Mauro
>=20


