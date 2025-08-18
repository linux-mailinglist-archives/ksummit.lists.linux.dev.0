Return-Path: <ksummit+bounces-2157-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD60B2B340
	for <lists@lfdr.de>; Mon, 18 Aug 2025 23:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A134E2883
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0612F2571BD;
	Mon, 18 Aug 2025 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdKBuNEh"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C203146585
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 21:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755551548; cv=none; b=YwgcsyPLYdSuKp5qVDefJudMLX8FpjDXGqqessK84cD4t2QT2+iRfhiOTPJSlO9iXFf0WUvY+IY6xMBpk5kK+bq+B/Hhry16w/AXxftV3Ji8SwavhnHeQ/K+a0iru+RMdVtWJt1KKG2MHIdkbHf181eyb3FjRg0I1EI5NkOuKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755551548; c=relaxed/simple;
	bh=zg7La1YRS4BOm2weBYyszlWIL+JZNMhGzbv6p6stSgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFuw0n53x1FJJ/rTQW6WWrj3GJLWedPxXtXE0ZK3TziPh4KLTOA5OdM2LtY7Q1liOwa8QfyGmM2n7h7ORYM8y9jA0LtmHqvmQvhlF71YjYQGbGSptkQy/WQuhwaHGl9FhjoOTmVaXtCF2wuj7Nt6iTBEShNbnZh5hMj8NiPhMgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdKBuNEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33598C4CEEB;
	Mon, 18 Aug 2025 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755551547;
	bh=zg7La1YRS4BOm2weBYyszlWIL+JZNMhGzbv6p6stSgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MdKBuNEhqJF053cBbaJXJEWB2UiY2Ead22kHcPv/RUyYn5KxeRkHOUIHRqVT888cK
	 KTDJ9ebzv/yy5sIEi5qCgH0rs5IRrdmTs2ES/f9BgIRdIo8h08ayUSWk2jCM4j4bcY
	 8spKQo8gpV05voXJyyji9cuDRBPem3qpec761ps/gRJfvNH8CCSGvZP/9vOzlt3maX
	 wE0ciqFhvSDkKTZJyPA9tqxeAb+nLOOEp8RN+KhjRmM/YErqiICETEfh4OOmVLP8MA
	 BkYsrUOt729SKa5NJM/TTw6SDCvTIEIDbIx7eGFoAwG7CoAJNGTTFBFgfjxw3YRQCd
	 ncOBQWt5yiGOg==
Date: Mon, 18 Aug 2025 23:12:23 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818231223.063c2f12@foz.lan>
In-Reply-To: <MW5PR13MB56323AC4400A7CC5A1880BE6FD2BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<MW5PR13MB56323AC4400A7CC5A1880BE6FD2BA@MW5PR13MB5632.namprd13.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 12 Aug 2025 13:15:33 +0000
"Bird, Tim" <Tim.Bird@sony.com> escreveu:

> > -----Original Message-----
> > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote:  
> > > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:  
> > > > On 05/08/2025 19:50, Sasha Levin wrote:  
> > > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:  
> > > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > > >
> > > > > > This is not really about legal aspects of AI-generated code and
> > > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > > DCO, etc.
> > > > > >
> > > > > > My concern here is more "human to human", as in "if I need to
> > > > > > talk to a human that actually does understand the patch deeply
> > > > > > enough, in context, etc .. who is that?"
> > > > > >
> > > > > > I believe we need to at least settle on (and document) the way
> > > > > > how to express in patch (meta)data:
> > > > > >
> > > > > > - this patch has been assisted by LLM $X
> > > > > > - the human understanding the generated code is $Y
> > > > > >
> > > > > > We might just implicitly assume this to be the first person in
> > > > > > the S-O-B chain (which I personally don't think works for all
> > > > > > scenarios, you can have multiple people working on it, etc),
> > > > > > but even in such case I believe this needs to be clearly
> > > > > > documented.  
> > > > >
> > > > > The above isn't really an AI problem though.
> > > > >
> > > > > We already have folks sending "checkpatch fixes" which only make
> > > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > > but are completely bogus otherwise.
> > > > >
> > > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > > problem, but tackling just the AI side of it is addressing one of
> > > > > the symptoms, not the underlying issue.  
> > > >
> > > > I think there is a important difference in process and in result
> > > > between using existing tools, like coccinelle, sparse or even
> > > > checkpatch, and AI-assisted coding.
> > > >
> > > > For the first you still need to write actual code and since you are
> > > > writing it, most likely you will compile it. Even if people fix the
> > > > warnings, not the problems, they still at least write the code and
> > > > thus this filters at least people who never wrote C.
> > > >
> > > > With AI you do not have to even write it. It will hallucinate,
> > > > create some sort of C code and you just send it. No need to compile
> > > > it even!  
> > >
> > > Completely agreed, and furthermore, depending on how that AI was
> > > trained, those using that AI's output might have some difficulty
> > > meeting the requirements of the second portion of clause (a) of
> > > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > > submit it under the open source license indicated in the file".  
> > 
> > Just on the legality of this.  Under US Law, provided the output isn't
> > a derivative work (and all the suits over training data have so far
> > failed to prove that it is),  
> 
> This is indeed so.  I have followed the GitHub copilot litigation
> (see https://githubcopilotlitigation.com/case-updates.html), and a few
> other cases related to whether AI output violates the copyright of the training
> data (that is, is a form of derivative work).  I'm not a lawyer, but the legal
> reasoning for judgements passed down so far have been, IMHO, atrocious.
> Some claims have been thrown out because the output was not identical
> to the training data (even when things like comments from the code in
> the training data were copied verbatim into the output).  Companies doing
> AI code generation now scrub their outputs to make sure nothing
> in the output is identical to material in the training data.  However, I'm not
> sure this is enough, and this requirement for identicality (to prove derivative work)
> is problematic, when copyright law only requires proof of substantial similarity.
> 
> The copilot case is going through appeal now, and I wouldn't bet on which
> way the outcome will drop.  It could very well yet result that AI output is deemed
> to be derivative work of the training data in some cases.  If that occurs, then even restricting
> training data to GPL code wouldn't be a sufficient workaround to enable using the AI output
> in the kernel.  And, as has been stated elsewhere, there are no currently no major models restricting
> their code training data to permissively licensed code.  This makes it infeasible to use
> any of the popular models with a high degree of certainty that the output is legally OK.
> 
> No legal pun intended, but I think the jury is still out on this issue, and I think it
> would be wise to be EXTREMELY cautious introducing AI-generated code into the kernel.
> I personally would not submit something for inclusion into the kernel proper that
> was AI-generated.  Generation of tools or tests is, IMO, a different matter and I'm
> less concerned about that.
> 
> Getting back to the discussion at hand, I believe that annotating that a contribution was
> AI-generated (or that AI was involved) will at least give us some assistance to re-review
> the code and possibly remove or replace it should the legal status of AI-generated code
> become problematic in the future.

Heh, it could produce exactly the opposite effect: anyone that may have
a code that slightly resembles a patch stating that AI was used could try
to monetize from such patch merge.

> 
> There is also value in flagging that additional scrutiny may be warranted
> at the time of submission.  So I like the idea in principal.


Thanks,
Mauro

