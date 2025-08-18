Return-Path: <ksummit+bounces-2154-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57BB2B1D8
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB825E469C
	for <lists@lfdr.de>; Mon, 18 Aug 2025 19:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C327381C;
	Mon, 18 Aug 2025 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK8QhQL0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DB92737F9
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755546259; cv=none; b=YrAvozoHd6iERBeodz3w/R3h5tupB+tHSKI5D5mZig2D2mEapPiWetb8CdTVVGg9CIN/rIiru15ioJni/IJcS25ZWh7EP6ga+mp0SE995AbEkivdHiPCsHqO+SHAPetjjPEriiyv24BOhjJwmCsutCQoIPIwHarnwLKMW5twkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755546259; c=relaxed/simple;
	bh=ivtpNVBa/3Tlch9iiqM2n6JfwpumK1WOLdXk/Xd8iqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2bioJ6r51E+z45MNkbHi6MAbwBh6WnQZnjQawIVNVlyKZn/bRh3A6hGj+2Y6EXmlnixO+/rlIjRr+eQ1xocYHTQ68y75d7aRmRE50n65SKFLBZKoDZp2clLVQq4nxtOMetd6yeNnaCRw0R+CbNSUUxJGtBNH7c7PgE7NUvFX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK8QhQL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE2C4CEEB
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755546259;
	bh=ivtpNVBa/3Tlch9iiqM2n6JfwpumK1WOLdXk/Xd8iqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vK8QhQL0XuNEKPRzAIUlUVc9RNZxjYgEs65RUnxXL+Ako0a4krBOiTMVGOUwHIChA
	 NOIKWZpT0XPc26Ploj+BK4RsvTmOzYHanurbhqOc3HnqZfgfOeTDWjQTszaWqA5H2a
	 PRK1UMFq3mRxbluQCSgCpH2IzqWdyiON03QFxpucqffK9FV4qUJOqt851e6kLsEh//
	 wh0yWOtbeqSo6ECBw7uoprlnxYKGtHQqKhpN6MSKwUzx6pjEwxQWguLE2S+1dIRTVs
	 SqenBkBfOFDn9n3uSirpE/hdIbd4MSUc5vMHxD9h9Z3el37nq5/cfo77CrYfTyoSfi
	 TaBHvKi5WE4TA==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-61c030a96f7so360772eaf.1
        for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 12:44:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUnZSUaahwf1sAkGdfRivwJ87evzqR5aHGj8AXNyl1tT7YFk/+kqNM+WUcWZt10+OXIq9kCh3+@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFIYyLzTq4DwMGAgnOEopC+xd+XTrduk3iAEIoEXlMLOpAugI
	fxScWNPNEAjffPzMhtGZ8IJplHefCxTYdWh4PPG1hYZpzKWFnoUVVsS4FvmvIHJAiL4dU8Vqby+
	Sx7d0xRjcd7HouiSQM8Csps38J597oWM=
X-Google-Smtp-Source: AGHT+IG2w/wYv4lMCCtv6Wpqx/gcmMru8OGXzkOfnAjTfd2P/XCfWiuWaqa7QZq/lC8ZPayaNwy0jdhnOYBoenAxL/M=
X-Received: by 2002:a05:6820:811:b0:61b:f3b6:4e38 with SMTP id
 006d021491bc7-61d91260a0cmr290932eaf.2.1755546258494; Mon, 18 Aug 2025
 12:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <20250818211354.697cb25a@foz.lan> <6o4sp81n-q5rr-6n92-o48o-4pr34s9n426q@xreary.bet>
In-Reply-To: <6o4sp81n-q5rr-6n92-o48o-4pr34s9n426q@xreary.bet>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Aug 2025 21:44:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hWT8GfiPbWZvcc3dYnM9zdsX40NeUiqDYT-7VWTTTqyQ@mail.gmail.com>
X-Gm-Features: Ac12FXw54pkIIKfTuZdH0C3eEwbpCehI_hfc87sINaKNhQrha5Jfu3_HppJl4eA
Message-ID: <CAJZ5v0hWT8GfiPbWZvcc3dYnM9zdsX40NeUiqDYT-7VWTTTqyQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted code
To: Jiri Kosina <jikos@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, paulmck@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 9:19=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 18 Aug 2025, Mauro Carvalho Chehab wrote:
>
> > On my tests with AI, humans need to modify it anyway. It reminds me
> > the (not so) good old code generators we had in the past: AI-generated
> > code, even when it works, it usually have unneeded steps and other
> > caveats that require human interaction to clean it up and fix.
> >
> > I got good results with AI for things like generating unit tests, but
> > once tests are generated, still 50%-60% of them fails because AI
> > did stupid things, like not counting whitespaces right, and even
> > sometimes forgetting parameters and arguments.
> >
> > From several aspects, it looks like contact a very junior intern
> > that knows a programming language and code really fast, but it has
> > no glue about how to generate a production quality level code.
> >
> > After dozens of interactions, the code can be used as the bases for
> > a senior professional to modify it and have something ready for
> > merging.
> >
> > The net result is that:
> >
> > 1. AI alone doesn't produce a ready-to-merge code;
> > 2. Lots of refinement requirements made by humans to shape the code
> >    into something that actually works;
> > 3. During AI interaction, human has to intervene several times to
> >    avoid AI to hallucinate. Sometimes, it also has to close the
> >    chat and open again - or even use a different LLM model when
> >    AI can't converge;
> > 4. At best scenario, human still needs to read the code and carefully
> >    modify for it to make sense; at worse, it has to write its own
> >    code, eventually using some suggestions from the AI hallucination.
>
> And the point is -- this all has now been much more easily available, and
> the increase pressure on maintainers is inevitable (pretty much everybody
> is now capable of submitting OK-ish looking code), so the
> submitter/maintainer ratio might become very unfair/unbalanced.
>
> Hence the need (I believe) to require proper annotation, even with all th=
e
> legal aspect aside.

I tend to agree that such annotations might be useful as heads-up
markers for maintainers if nothing else, but what about missing
annotations?

Is there a generally feasible way to figure out that they are missing?
 And if that can be done, "suspicious" changes may as well be caught
this way, so why would the annotations be required after all?

