Return-Path: <ksummit+bounces-2172-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80123B2F540
	for <lists@lfdr.de>; Thu, 21 Aug 2025 12:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D86603E18
	for <lists@lfdr.de>; Thu, 21 Aug 2025 10:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD9F2F1FC6;
	Thu, 21 Aug 2025 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMwz0wxR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A324A06D
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771813; cv=none; b=NqTLnhAeqfe2Ax1Keu9ECB45ZJ4xl6wW72nfh6ZNQIHLLPP5m9RNilkfVLzw499NDPUATVY+7B/bULnGZNwx6u3ws0w6pCXBrDIUhbje3GQx44JR06BJBA1BQGma7JjJxajRqBHZicFYCuUfCMvgcAAk2GZbdBhFDZh745sZU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771813; c=relaxed/simple;
	bh=On05gZiqloJDJpnZfMvzOT9D11TM0YHujiqyN/6pLJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FnJXwwt1DNVFuHa97evYH2oleUrhw+Xd2Gs+dwv0d9V8VpgK6EPWnt804dyyfZmF7FN9CjP+WMorWjy/3jdB9iz7NN1wssiI8C8Ifc3DVZtJ7PEsmt/8SnmRMOCUcUEVDetRl1TroZ6M0vD5DKQ1xCZULHhZm+P2vbFVniEr9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMwz0wxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F11C4CEEB;
	Thu, 21 Aug 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755771812;
	bh=On05gZiqloJDJpnZfMvzOT9D11TM0YHujiqyN/6pLJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QMwz0wxRI5Yf10/h9Ge93b4AOhHCOsmxE1xoVCoY/lLU57IznSoV+rouTyHWP2kXu
	 hWjfXrw3o269WzU1jCiD7Qi8or9Kw/spiR0EgU6bej6GjlrhpQLnJ3rIp3E/F72iaa
	 hlV/kMlD0YbsMPT8PZsYDfUw57RWUa4SU736bkZyrcl7Wl3v/adzkf5AA8A97q7pbg
	 RbF5jrJIsaKEl0+rMSTfv2c164UY/4UwIj3CHQHRDC6r6YqtCj80aCBu/362rE+QPw
	 7rDqrWKv1e92ughwADqwxOSQdx84Nf36oaF8bJXSwclXYeng0PvS6Rp8MrbJZ/mw9Q
	 P3Qlgha+6g45w==
Date: Thu, 21 Aug 2025 12:23:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821122329.03c77178@foz.lan>
In-Reply-To: <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 20 Aug 2025 14:44:00 -0700
"Paul E. McKenney" <paulmck@kernel.org> escreveu:

> On Tue, Aug 19, 2025 at 06:16:10PM +0200, Mauro Carvalho Chehab wrote:
> > On Tue, Aug 19, 2025 at 04:23:46PM +0100, James Bottomley wrote: =20
> > > On August 18, 2025 10:07:29 PM GMT+01:00, Mauro Carvalho Chehab <mche=
hab+huawei@kernel.org> wrote: =20
> > > >Em Tue, 12 Aug 2025 07:42:21 -0700
> > > >"Paul E. McKenney" <paulmck@kernel.org> escreveu: =20
> > > [...] =20
> > > > do agree that many of the lawsuits seem to be motivated by an =20
> > > >> overwhelmening desire to monetize the output of AI that was induce=
d by
> > > >> someone else's prompts, if that is what you are getting at.  It do=
es seem
> > > >> to me personally that after you have sliced and diced the training=
 data,
> > > >> fair use should apply, but last I checked, fair use was a USA-only=
 thing. =20
> > > >
> > > >Maybe, but other Countries have similar concepts. I remember I saw an
> > > >interpretation of the Brazilian copyright law once from a famous lay=
er
> > > >at property rights matter, stating that reproducing small parts of a=
 book,=20
> > > >for instance, could be ok, under certain circumstances (in a concept
> > > >similar to US fair use). =20
> > >=20
> > > Yes, technically.  Article 10 of the Berne convention contains a weak=
er concept allowing quotations without encumbrance based on a three prong t=
est that the quote isn't extensive,  doesn't rob the rights holder of subst=
antial royalties and doesn't unreasonably prejudice the existing copyright =
rights. =20
> >=20
> > Exactly. The interpretation from such speech I mentioned is based on th=
at.
> > Now, exactly what is substantial is something that could be argued.
> >=20
> > There are two scenarios to consider:
> >=20
> > 1. AI using public domain or Open Source licensed code;
> >=20
> > There are so many variations of the same code patterns that AI
> > was trained, that it sounds unlikely that the produced output would
> > contain a substantial amount of the original code.
> >=20
> > 2. Public AI used to developt closed source=20
> >=20
> > If someone from VendorA trains a public AI to develop an IP protected d=
river
> > for HardwareA with a very specialized unique code, and someone asks the
> >  same AI to:
> >=20
> > 	"write a driver for HardwareA"
> >=20
> > and get about the same code, then this would be a possible legal issue.=
=20
> >=20
> > Yet, on such case, the developer from VendorA, by using a public AI,
> > and allowed it to be trained with the code, opened the code to be used
> > elsewhere, eventually violating NDA. For instance, if he used
> > Chatgpt, this license term applies:
> >=20
> > 	"3. License to OpenAI
> >=20
> > 	 When you use the service, you grant OpenAI a license to use
> > 	 your input for the purpose of providing and improving the=20
> > 	 service=E2=80=94this may include model training unless you=E2=80=99ve=
 opted out.
> >=20
> > 	 This license is non-exclusive, worldwide, royalty-free,=20
> > 	 sublicensable=E2=80=94but it's only used as outlined in the Terms of =
Use
> > 	 and privacy policies."
> >=20
> > So, if he didn't opt-out, it granted ChatGPT and its users a patent-free
> > sublicensable code.
> >=20
> > Ok, other LLM tools may have different terms, but if we end having
> > to many people trying to monetize from it, the usage terms will be
> > modified to prevent AI holders to face legal issues.
> >=20
> > Still, while I'm not a lawyer, my understanding from the (2)
> > is that if one uses it for closed source development and allowed
> > implicitly or explicitly the inputs to be used for training, the one
> > that will be be accounted for, in cases envolving IP leaking, is the
> > person who submitted IP protected property to AI. =20
>=20
> Many of the AI players scrape the web, and might well pull in training
> data from web pages having a restrictive copyright.  The AI's output
> might then be influenced by that restricted training data.=20

True, but this is not different than a developer seeking the web for
answers of his development problems, reading textbooks and/or reading=20
articles.

Also, if someone publicly document something an any sort of media,
it is expected that people will read, adquire knowledge from it and
eventually materialize the acquired knowledge into something. This
is fair use, and has some provision from Berne convention, although
it may depend on each Country's specific laws.

On my view, if the trained data comes from lots of different
places, as AI is actually a stochastic process that write
code by predicting the next code words, if there's just one web=20
site with an specific pattern, the chances of getting exactly
the same code are pretty low. It is a way more likely that humans
would pick exactly the same code as written on his favorite
textbook than an LLM feed with hundreds of thousands of web
sites.

> Although we
> might desperately want this not to be a problem for AI-based submissions
> to the Linux kernel, what we want and what the various legal systems
> actually give us are not guaranteed to have much relation to each other.

True, but that's not the point. AI is not that different than
someone googling the net to seek for answers.

The only difference is that, when AI is used, you won't know
exactly from where the code was based.

I agree that this could be problematic. But then, again, when a maintainer=
=20
picks a patch from someone else, the same applies: we don't have any
guaranties that the code was not just copied-and-pasted from some place,
except by the SoB.

In any case (either AI, human or hybrid AI/human), if the code has issues,
we may need to revert it.

On other words, AI doesn't radically changes it: at the end, all remains
the same.

That's why I don't think we'll get any new information nor need to
follow any procedure different than what we already do, if the developer
had used AI, and to what extent.

-

Now, a completely different thing is if we start having "incompetent"
developers ("incompetent" in the sense given by the Dilbert Principle) that
have some AI bot patch-generator to write patches they can't do themselves.

I'll certainly reject such patches and place such individuals on my
reject list.


Thanks,
Mauro

