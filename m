Return-Path: <ksummit+bounces-2111-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D01B217A1
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597861905960
	for <lists@lfdr.de>; Mon, 11 Aug 2025 21:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A83728466E;
	Mon, 11 Aug 2025 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpYnjFrU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA981311C2E
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754948772; cv=none; b=HXzmKfQlOAMLLUt7nXbaWasNtKURZSZgY2Vq0LoMl6nO4VieFHDNgb8CHR4X5K3kOG2zBUCw/cLCU1a0QzQPR+L+/mJrEkN/ZUNhWbnfdciqD0DsZeLhc50+YkdbxkBX2wWGVHzhIDz6J5z5wgCEZPLIVoK19i09MlZk+PgqAlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754948772; c=relaxed/simple;
	bh=UqtcwJ4Tz8uMRswv+ApTRb0ofReVvAx/Ur29Lo0uVj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrB7q3lNwt7ulPaEyCCcS1f1kvi4O9BrRiBY9Ht2H1amfek/dLqGdSgvaC/wbKbUnrvlHvXwDEKIij0YWrDf5bYOQQQ2GE525W4wSQVGgl/ilJAAJ6qXJizZXNYBy+ZOWvbGIlqL1qH9N2jIDz1HviUdo5ge21aK8a4lb+TKswA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpYnjFrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C737C4CEED;
	Mon, 11 Aug 2025 21:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754948771;
	bh=UqtcwJ4Tz8uMRswv+ApTRb0ofReVvAx/Ur29Lo0uVj8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=EpYnjFrUgieE7enZ6wMQrd28SsE9dTIcqg6zIu6RV24/E7LAszs2nqdp/TEE5dBhv
	 oKwclUPaEHB1Zt+jrPCk3wjRcK5jeJVaadEu0GIRWYgEmvcI+LXiObsFmpcfx3l0yO
	 uZJonJChiVPYDqlWbh6yYP4p8dPabHZhFPXO61b6TyC1XG/6UfmpUAhlNj6MwZ9ek/
	 vBV4IUraEtg0Icks72e1cocRaCsDGcjC57vI5P3d2LmoWlkMTkQl6x+gu6jNYohw8U
	 QI7MX9pnwHvnxdCgVH9Weh5E0ILmNfPRa9f0GUnWW8tIUqNf287Kt1slgvGtK0faap
	 AHoZW0apOmSHQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1E434CE0965; Mon, 11 Aug 2025 14:46:11 -0700 (PDT)
Date: Mon, 11 Aug 2025 14:46:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>

On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2025 19:50, Sasha Levin wrote:
> > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> >> This proposal is pretty much followup/spinoff of the discussion currently
> >> happening on LKML in one of the sub-threads of [1].
> >>
> >> This is not really about legal aspects of AI-generated code and patches, I
> >> believe that'd be handled well handled well by LF, DCO, etc.
> >>
> >> My concern here is more "human to human", as in "if I need to talk to a
> >> human that actually does understand the patch deeply enough, in context,
> >> etc .. who is that?"
> >>
> >> I believe we need to at least settle on (and document) the way how to
> >> express in patch (meta)data:
> >>
> >> - this patch has been assisted by LLM $X
> >> - the human understanding the generated code is $Y
> >>
> >> We might just implicitly assume this to be the first person in the S-O-B
> >> chain (which I personally don't think works for all scenarios, you can
> >> have multiple people working on it, etc), but even in such case I believe
> >> this needs to be clearly documented.
> > 
> > The above isn't really an AI problem though.
> > 
> > We already have folks sending "checkpatch fixes" which only make code
> > less readable or "syzbot fixes" that shut up the warnings but are
> > completely bogus otherwise.
> > 
> > Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> > tackling just the AI side of it is addressing one of the symptoms, not
> > the underlying issue.
> 
> I think there is a important difference in process and in result between
> using existing tools, like coccinelle, sparse or even checkpatch, and
> AI-assisted coding.
> 
> For the first you still need to write actual code and since you are
> writing it, most likely you will compile it. Even if people fix the
> warnings, not the problems, they still at least write the code and thus
> this filters at least people who never wrote C.
> 
> With AI you do not have to even write it. It will hallucinate, create
> some sort of C code and you just send it. No need to compile it even!

Completely agreed, and furthermore, depending on how that AI was
trained, those using that AI's output might have some difficulty meeting
the requirements of the second portion of clause (a) of Developer's
Certificate of Origin (DCO) 1.1: "I have the right to submit it under
the open source license indicated in the file".

							Thanx, Paul

