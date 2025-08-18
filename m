Return-Path: <ksummit+bounces-2159-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1267B2B38F
	for <lists@lfdr.de>; Mon, 18 Aug 2025 23:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65531BA1A14
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C69C21B9F1;
	Mon, 18 Aug 2025 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzLY6I7G"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF9217F23
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755553296; cv=none; b=Bfl1/3NnTHtW8+1eq99PNNtbcZB7wx9jk+/IqFCY2/BrZdbZDeKiV3DZk3VU1q/ObHfBlVOYY91PE/S74Zhhl4CeG6AgiU4gOXZRIeT3x9IQacqqIkWKzYsCLwXVN2vR9PcEhnQzz5Rum6AjliDq79dT25Gqg05T2b1I44Y70Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755553296; c=relaxed/simple;
	bh=9gQMTNlbT8CAQzHFwAoOKHW0ehZR6y/LI62jtdJeuZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fja7EuSC6hVmNeewtaML4nTc48ay/ZBFL/Pd4YKdhJLuGMZcRQNEZCXL0ndvUuJ78ZtVQa/GumkI3rg5VJsQF51i+3oaPuHxhMaqiaZ4dtsig7jaSe3C12E513DCXtd4vPw76L68sVaAiTIlripd7Y6HG4zqjVO2pyqrbYvgJNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzLY6I7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BA0C4CEEB;
	Mon, 18 Aug 2025 21:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755553294;
	bh=9gQMTNlbT8CAQzHFwAoOKHW0ehZR6y/LI62jtdJeuZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YzLY6I7G27ST29G6NQR4zatVtNFO5bVIInpVsJVqrC8sJJX8zfCn+4gSTSNkq4OgB
	 D3KHyi5m3+V11e5OXmpb93DqXWVCHZ4mdMCTCZOPnDs+CKUbxQSOwNBEPbvZwn6ohJ
	 Rm31es93N0eUFV+XpTLc7p0VXq/ZFFwri2a36Dch9p1zjLNNDC5xcnXjl55UebJjHd
	 HddKMISotM5s7NMokB82YVWEhyFahgjK7Kaa5uBCcRkLzQfKrZQh/A5zkSWjQbvXbQ
	 +Yn6AQiQmVFjSN8NtAYisuXgqs0HoVhd2/lkDW1Sj5+4eDO2Dm4um4SrW5Vr+yUZoV
	 7HARUwBv0ehfQ==
Date: Mon, 18 Aug 2025 23:41:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818234129.1e5e537b@foz.lan>
In-Reply-To: <aJp7LbfETVBH5L0A@bombadil.infradead.org>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpqo48FgDLglg-p@bombadil.infradead.org>
	<a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
	<aJp7LbfETVBH5L0A@bombadil.infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 11 Aug 2025 16:22:21 -0700
Luis Chamberlain <mcgrof@kernel.org> escreveu:

> On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:  
> > > b) seems kind of too late  
> > 
> > Why?  
> 
> One cannot assume at this point AI generated code has not been merged
> into any large scale open source project.
> 
> I am also not sure it can be stopped.

Agreed. The same applies to all other patches: nobody can really tell if
some code could potentially contain code not developed by the submitter.

To be frank, considering that most companies nowadays have policies of
not using public AI for private code, I suspect that AI generated code
contains only public domain code or open source. As open source licenses
explicitly allow one to learn from the written code, except if AI
(and the developer using it) are just copying the code, it will very
likely be at the already allowed open source license clauses.

Now, when someone from a company submits a patch for the company
hardware, for instance, it is a lot harder for a maintainer to be
sure that such submission was approved. The SoB is a sort of
protection for us, as the submitter declared that he had the
permissions.

So, at least from my side, provided that the patch is good(*), I'm not
concerned if it used AI to help him or not.

(*) good patch means that, even if AI was used, a human adjusted
    it to ensure its quality.

Thanks,
Mauro

