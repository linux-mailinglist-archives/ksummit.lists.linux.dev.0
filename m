Return-Path: <ksummit+bounces-1219-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C438FBEFF
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC2C5286609
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255EE14291B;
	Tue,  4 Jun 2024 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeWYAQke"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FB28DC7
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540447; cv=none; b=T6j8p/EVttVQBwTGsCEWcOiViUE9Q7hUHxaYU6QbXyH6N5MJZh3LNuWkAXWoThx5YInrYf2LbIlQ01n1ZecfRFG2NyGdvnAg25iXI4lvuqnE4ZY5lJ4tjTqNsEBnhsqcYr5PhVKA9sl6Dd78A8YT4O7uw4S+mKpd9JvU/gwQWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540447; c=relaxed/simple;
	bh=Y3edHKbxye1z8eCKgVpRVRp2vs+gtlBE+L7p0N/rLyw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PpVcO0VLSpODEXGtYBDijIZc8OkKYEXXgOd5HJWaV0Otljny5bPhch2bns3yBRsuQoLLAckTgLErkGasLcgU+BokszW7dV3Wga1WFw+OGK8QKuzEKhGkFtCBqzr06jfNUe3neRpP2y4gwYwR2kekGq39cAKTUeQkGqx1M0qFqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeWYAQke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAD6C2BBFC;
	Tue,  4 Jun 2024 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717540447;
	bh=Y3edHKbxye1z8eCKgVpRVRp2vs+gtlBE+L7p0N/rLyw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LeWYAQke2bsdi9o74z9HCl2rpjVjF5b6clFnRc3dgCOAQZ1OohbanWfiXDaxEpOnc
	 f40MDFSi35N3pLrHC/IiJuFB0TffFOX97hD3KZQq1X6xgGfaxEKU+HnP+aRGSJglwQ
	 SlbecfGmlI3YWxIN/6jF1DYLZfj1QaIfbv9Pn2HNou20GpU4V/P+0sHh5hh3VjtKDN
	 24ou5OlWPnA23YzQxWPZminIPXZjtYbELuqLlEtjMpVOkqienRn6gY0NptVmTECpYK
	 f9GdrK17wvnUzpgY8A6Emp2gXSyk+bNNYOCvXmMesZpIhmufPPrcysd9NWpULNjMru
	 /LNR0n0aXLlnQ==
Date: Wed, 5 Jun 2024 00:34:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
In-Reply-To: <20240604182137.2cfdc0b2@gandalf.local.home>
Message-ID: <nycvar.YFH.7.76.2406050028090.24940@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm> <20240604182137.2cfdc0b2@gandalf.local.home>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jun 2024, Steven Rostedt wrote:

> Note, the git tree may hide some hierarchy too. For example, I'm starting
> to do pulls from Daniel Bristot for his rtla tooling. But since I have a
> topic branch for his work, I just do a fetch from his pull request, and
> then copy his pull request cover letter (with some tweaks) directly to Linus.

Right; that's exactly how it should be done in my view.

But if Daniel's tree has always fed into yours (no matter whether the 'git 
merge' way or 'apply patch' way), in doesn't really decrease the net 
effort one level above.

> > - is this really something that could improve maintainer load (on all 
> >   levels) and throughput if done properly?
> 
> Topic branches.

Oh, if you check hid.git, you'll see I am a huge fan of topic branches :)

We have a topic branch pretty much for every driver (and we have quite a 
number of them), plus one for patches to core.

And it has worked pretty well for many years already, the only downside I 
can imagine being that the ultimate 'for-linus' (or whatever else 
for-upstream) branch/tag is seeing quite a lot of driver-specific branches 
being merged. But I don't think that's a big problem.

> > - how could we motivate maintainers to change the process and delegate 
> >   more into proper hierarchical sub-trees?
> 
> Now with more topic branches, it may be even easier to get others to take
> over. Daniel does changes for rtla, and Masami Hiramatsu does all the probe
> logic. Perhaps the first step is just to have maintainers split up their
> work.

Agreed.

-- 
Jiri Kosina
SUSE Labs


