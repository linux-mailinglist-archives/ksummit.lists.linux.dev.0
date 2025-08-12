Return-Path: <ksummit+bounces-2141-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16EB22CE6
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201BD6220C3
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2883A23D7D1;
	Tue, 12 Aug 2025 16:00:53 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607ED2D6407
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014452; cv=none; b=fXCbOqMAYXoSJiNaP/Mdo1IIlmS/83mbXfO941BjI+etNfl5PoHgXlLY10LIxx1+x9q9Fmo+DRqGNedhBlLbg6Po4yM81v/huJOEYGuRLvDa3TWbFaMrNq6ulnD0T2csB4US3bpuAO3JAjbaEz0Vl/Y04v8LUHzGC3KVx8lrDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014452; c=relaxed/simple;
	bh=aZ54SB+zdywP338n9LGgsjnCQHbPRFwaFFvxvAwMloU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjybCjUTwUP+gAzXuJNCuylRrVm1EDXpAgjEcPMUf6ouuHBmZG5cKLBStGmpSoMH7JIQ6sfk9Ws/31zYEZ13U5SVFODJ1bM4Wx9L1R+K//A5GwrVs76ea0HVkBoJOLsYHlhEgvntA16ISCVBD7fR3f93VqCccOpSOeO+Yx3A4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 5E7D71603AB;
	Tue, 12 Aug 2025 16:00:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 75E7135;
	Tue, 12 Aug 2025 16:00:46 +0000 (UTC)
Date: Tue, 12 Aug 2025 12:01:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250812120131.1f4cf045@gandalf.local.home>
In-Reply-To: <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpqo48FgDLglg-p@bombadil.infradead.org>
	<a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 75E7135
X-Stat-Signature: qknsdatardsfitfmbuh3s3ycng1xnco3
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Tw8IIoKy1JWb3gExacjdwiBjZ04zCzY0=
X-HE-Tag: 1755014446-43318
X-HE-Meta: U2FsdGVkX1/5KStXxJIBndmUNXD0F3DekHx4o1PVin/R3POvF1QSLVE3KrZD53xRIIShGoevkHGvb2nRWX3Vm8eaYFDHiURoMWsTF+XQ9idNI2Lvd5GCnyEjitGlx9XH8ZhNDmtj2fKNAg2Fo86II7KbfetUNLu/BTfsZtXsQz52UKUIeTLxSrYzsa3o25C/iMnDFP1DUVXio5Xx/ZNfSROweQkZbYeLbiVY8JwzM7VpVXeKNz0fvzKAcj6lC5PszXQ2x+5R2aCTICACgF+XjDTeVNWZf0XQieAErQQPGNLJ/pgTw3sGBLFNiMql1PB7uCiOt3y4lpanjKFmcTrbhfDlonn5EaFFdE+hjxluhwdaa1rZ0oCbLA==

On Mon, 11 Aug 2025 15:51:48 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > a) isn't this debatable? Do we want to itemize a safe list for AI models
> >    which we think are safe to adopt for AI generated code?  
> 
> For my own work, I will continue to avoid use of AI-generated artifacts
> for open-source software projects unless and until some of the more
> consequential "debates" are resolved favorably.

Does that include people who submit AI generated code to you?

This would also require AI use disclosures.

-- Steve

