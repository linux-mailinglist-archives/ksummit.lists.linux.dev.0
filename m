Return-Path: <ksummit+bounces-2156-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B0B2B332
	for <lists@lfdr.de>; Mon, 18 Aug 2025 23:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD8A4E1436
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1267F2571BD;
	Mon, 18 Aug 2025 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss3Vz5SQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4CE20B7F4
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 21:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755551254; cv=none; b=e/qJRf0RMZAiH6PdwKrXUm+CvkqeVhP/Uyhr3MQLqm3ajJUMVd7Xk9ThSNbzUho2Y1bF6paAMMawiQSR09zbapuCZY9yf9MEJfdAbklz/v/Dek9O6FdEuRvNKf2Qs3LXPwHKVtckk6lQdSDiqeIyrwG+baeznfcQiu0nTA1GVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755551254; c=relaxed/simple;
	bh=y3M92/3w9ZfvMJRyvqwDUgfZITiZR4nWu3G7epCkPyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/glGLRyLyZczJkOkJUozVAgg43Q+C+1pFDppm7H1q3viqSlFkRGYcIVjYvDilssG7lTODDV17CN+kW6ywc33oQrLS9iEJFOQQqjZIjDE6TpYCjm35KogjJnE8yCYM8XYOzhij52SrhcJZrQhEJYsxqkkZ2QVT9/nNm+aY/Y4Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss3Vz5SQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F10DC4CEEB;
	Mon, 18 Aug 2025 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755551254;
	bh=y3M92/3w9ZfvMJRyvqwDUgfZITiZR4nWu3G7epCkPyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ss3Vz5SQD94ZA71FqUWsv+SdKRW5nMaxFQW7Y6LwvPo4HZEyHa424Lyv7R+IFI+SZ
	 d/3VNfL/MyN4qXFHE+CijkDshYvQKYkwq+3XEASYIbE4PXPFmynvZ9JRuogv79puz3
	 irdJKyNw8/8DoE1dKt2GP/bZPa7bn3PFg37bjMMU4TsQZOxMNvom46IRXZ9yAfS+3H
	 hMXCSi4YJ2WQlh5dijNqsFpjZjXxc1I9O1DawFBXdyDKC7f+FSsZhSoOTHKpgoJm7i
	 SYr1il6JwORXz+uZEwFhn9RNbHU+M8is4skZ7coQri+3qlBVkrT/bx3aum3mBDOt4x
	 uZM7sy7hL+3wA==
Date: Mon, 18 Aug 2025 23:07:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818230729.106a8c48@foz.lan>
In-Reply-To: <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 12 Aug 2025 07:42:21 -0700
"Paul E. McKenney" <paulmck@kernel.org> escreveu:

> On Tue, Aug 12, 2025 at 09:38:12AM +0100, James Bottomley wrote:
> > On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote: =20
> > > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote: =
=20
> > > > On 05/08/2025 19:50, Sasha Levin wrote: =20
> > > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote: =20
> > > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > > >=20
> > > > > > This is not really about legal aspects of AI-generated code and
> > > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > > DCO, etc.
> > > > > >=20
> > > > > > My concern here is more "human to human", as in "if I need to
> > > > > > talk to a human that actually does understand the patch deeply
> > > > > > enough, in context, etc .. who is that?"
> > > > > >=20
> > > > > > I believe we need to at least settle on (and document) the way
> > > > > > how to express in patch (meta)data:
> > > > > >=20
> > > > > > - this patch has been assisted by LLM $X
> > > > > > - the human understanding the generated code is $Y
> > > > > >=20
> > > > > > We might just implicitly assume this to be the first person in
> > > > > > the S-O-B chain (which I personally don't think works for all
> > > > > > scenarios, you can have multiple people working on it, etc),
> > > > > > but even in such case I believe this needs to be clearly
> > > > > > documented. =20
> > > > >=20
> > > > > The above isn't really an AI problem though.
> > > > >=20
> > > > > We already have folks sending "checkpatch fixes" which only make
> > > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > > but are completely bogus otherwise.
> > > > >=20
> > > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > > problem, but tackling just the AI side of it is addressing one of
> > > > > the symptoms, not the underlying issue. =20
> > > >=20
> > > > I think there is a important difference in process and in result
> > > > between using existing tools, like coccinelle, sparse or even
> > > > checkpatch, and AI-assisted coding.
> > > >=20
> > > > For the first you still need to write actual code and since you are
> > > > writing it, most likely you will compile it. Even if people fix the
> > > > warnings, not the problems, they still at least write the code and
> > > > thus this filters at least people who never wrote C.
> > > >=20
> > > > With AI you do not have to even write it. It will hallucinate,
> > > > create some sort of C code and you just send it. No need to compile
> > > > it even! =20
> > >=20
> > > Completely agreed, and furthermore, depending on how that AI was
> > > trained, those using that AI's output might have some difficulty
> > > meeting the requirements of the second portion of clause (a) of
> > > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > > submit it under the open source license indicated in the file". =20
> >=20
> > Just on the legality of this.  Under US Law, provided the output isn't
> > a derivative work (and all the suits over training data have so far
> > failed to prove that it is), copyright in an AI created piece of code,
> > actually doesn't exist because a non human entity can't legally hold
> > copyright of a work.  The US copyright office has actually issued this
> > opinion (huge 3 volume report):
> >=20
> > https://www.copyright.gov/ai/
> >=20
> > But amazingly enough congress has a more succinct summary:
> >=20
> > https://www.congress.gov/crs-product/LSB10922 =20
>=20
> Indeed:
>=20
> 	While the Constitution and Copyright Act do not explicitly define
> 	who (or what) may be an "author," U.S. courts to date have not
> 	recognized copyright in works that lack a human author=E2=80=94including
> 	works created autonomously by AI systems.
>=20
> Please note the "U.S. courts *to* *date*".  :-(
>=20
> > But the bottom line is that pure AI generated code is effectively
> > uncopyrightable and therefore public domain which means anyone
> > definitely has the right to submit it to the kernel under the DCO.
> >=20
> > I imagine this situation might be changed by legislation in the future
> > when people want to monetize AI output, but such a change can't be
> > retroactive, so for now we're OK legally to accept pure AI code with
> > the signoff of the submitter (and whatever AI annotation tags we come
> > up with). =20
>=20
> Except that the USA is a case-law jurisdiction, and changes
> in interpretation of existing laws can be and have been applied
> retroactively, give or take things like statutes of limitations.  And we
> need to worry about more than just USA law.
>=20
> And I do agree that many of the lawsuits seem to be motivated by an
> overwhelmening desire to monetize the output of AI that was induced by
> someone else's prompts, if that is what you are getting at.  It does seem
> to me personally that after you have sliced and diced the training data,
> fair use should apply, but last I checked, fair use was a USA-only thing.

Maybe, but other Countries have similar concepts. I remember I saw an
interpretation of the Brazilian copyright law once from a famous layer
at property rights matter, stating that reproducing small parts of a book,=
=20
for instance, could be ok, under certain circumstances (in a concept
similar to US fair use).


Thanks,
Mauro

