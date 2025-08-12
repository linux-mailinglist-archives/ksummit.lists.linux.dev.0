Return-Path: <ksummit+bounces-2146-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A7B22D89
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10189682B57
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2932F6579;
	Tue, 12 Aug 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owLftb1A"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F223D7D4
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015757; cv=none; b=HUvq1ms0nrCgGmwFHJ+OOeEO+07yXIv0FFMisOPQb4RUAStdKVY7y1dCWVDOrt5ITF3//f0+uZ6j8DdmTnTbsMFtiXX7zhY4BwDIAbnNKZfMYiN+J1iUxZ5ETBwchHulSOXDhvApUQZnr4Un8BCFuAFzX4Jlj8ut1r3VoR/RKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015757; c=relaxed/simple;
	bh=YAYowHpuQDCZTG3qA+5HdLtd+Worhd5mwfclJ1gSaPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hirA0sgiKO4C+E1rOKhN7cywOgE9+FxwFktiLd55Q1UnHEae7Y6Ib4mb48d5papXfp/uC7UfICmnPB0FuBTGHMyc57aHKpwC1g5FcI+b5CH8VGQqZDd89ZWD62OqErebt36SbgFi/k5qNdDyRsF0RB6xaa60zp2OvnDizCQY3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owLftb1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F76C4CEF7;
	Tue, 12 Aug 2025 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015757;
	bh=YAYowHpuQDCZTG3qA+5HdLtd+Worhd5mwfclJ1gSaPU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=owLftb1A8revLYvPtPjbl9BlKMLLIbGtcR0Ug0vc1M6yHF9nvN8R2+AAp7Icp52jq
	 zDINelgw4KTDmMroE+i1M5cEXbzFQkjmtGbLAaY/yFWTTBp5OaVO4jfNXrT29tX8VF
	 wyntcdwRQ8vxMRqdiQ2hmrsLUCereyjKfYpybLcU4jREp6NLgLVfd4aIm0NKjsKdzv
	 rMzH+gBPsjQHpQj1M4o5pRAKhdpM5WohnU6vxZsLSFsosPd7LytjXPyynQTNesqCgV
	 WoJJEBgLlHQ5Cf0FZYqhld5YRHvq3r8xMWjr0S0XDAcoa6Sg1T5+9BgK7q2U3w2kdM
	 H4tKAbTX0Lnrw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 01FBBCE091E; Tue, 12 Aug 2025 09:22:36 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:22:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <a69a8df9-af0c-4ee9-9931-2c160cce141e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <20250812120131.1f4cf045@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812120131.1f4cf045@gandalf.local.home>

On Tue, Aug 12, 2025 at 12:01:31PM -0400, Steven Rostedt wrote:
> On Mon, 11 Aug 2025 15:51:48 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > a) isn't this debatable? Do we want to itemize a safe list for AI models
> > >    which we think are safe to adopt for AI generated code?  
> > 
> > For my own work, I will continue to avoid use of AI-generated artifacts
> > for open-source software projects unless and until some of the more
> > consequential "debates" are resolved favorably.
> 
> Does that include people who submit AI generated code to you?
> 
> This would also require AI use disclosures.

We have all avoided applying patches containing copyright violations
for a very long time.  And the possibilility of such violations is one
thing that seems to me to be adddressed by the DCO, which says (among
other things):

	I have the right to submit it under the open source license
	indicated in the file

Whether we like it or not, there are lawsuits in flight that could
potentially come to decisions that result in incorporation of AI-generated
code into the Linux kernel being copyright violations, which would
mean that the submitter does not have the right to submit.

And no, I have no way to identify AI-generated code.  If I mistakenly
incorporate some AI-generated code, I must rip it out and clean-room
construct some alternative.  Just as is already the case for other
potential legal issues.

							Thanx, Paul

