Return-Path: <ksummit+bounces-1221-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD28FBF3C
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B666E1C24AC5
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B807514C58A;
	Tue,  4 Jun 2024 22:45:07 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712ED14C5AE
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717541107; cv=none; b=lCBm14nvA9mc8CEy6HnCHZjzuTLMBrKLf6dFIi4weqnB65GVT52kaeLQmZlYADCMtP6mpTjNHupEvRN7ugsiQ7FM6srZO9StWLIi2NGx56C+IOTrgaSM6cyygAwjmC8ab+WDFgArm5R8JWOtB1OGcnZthATnjqxfdqK93+RxIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717541107; c=relaxed/simple;
	bh=84Vy09vnLCOWNP3zxbvv0y2fSylK/0SUTe/KQEzdCyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GRMTTsmjqB2XwwS+5DJ5dfVAG5VgJ/PIjlNcqs090cT8INc7fYcEvhwKn/9NK+qb6/FaX1zTZtv1H5xuv2eRwB31fG1zl73SX55g2e1yW/knvr+a/7Rc69nfM2t87yV+nNtqTL7NeQvPbG+teHvmEyncVnkEKpzdknniP7VCh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05DEC2BBFC;
	Tue,  4 Jun 2024 22:45:06 +0000 (UTC)
Date: Tue, 4 Jun 2024 18:45:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <20240604184506.007c4682@gandalf.local.home>
In-Reply-To: <nycvar.YFH.7.76.2406050028090.24940@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
	<20240604182137.2cfdc0b2@gandalf.local.home>
	<nycvar.YFH.7.76.2406050028090.24940@cbobk.fhfr.pm>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Jun 2024 00:34:04 +0200 (CEST)
Jiri Kosina <jikos@kernel.org> wrote:

> On Tue, 4 Jun 2024, Steven Rostedt wrote:
> 
> > Note, the git tree may hide some hierarchy too. For example, I'm starting
> > to do pulls from Daniel Bristot for his rtla tooling. But since I have a
> > topic branch for his work, I just do a fetch from his pull request, and
> > then copy his pull request cover letter (with some tweaks) directly to Linus.  
> 
> Right; that's exactly how it should be done in my view.
> 
> But if Daniel's tree has always fed into yours (no matter whether the 'git 
> merge' way or 'apply patch' way), in doesn't really decrease the net 
> effort one level above.

I disagree. I use to take his patches and pull them in. But having him do
it, and also write the pull request, makes my job so much easier.

Note, I review his work, but not some much as if I were to review his
patches. I look at it at a different level when it's a pull request. I
trust Daniel enough to not go through his work with a fine comb, but
instead just look to make sure the general idea is sound.

How would imagine this being different than having a hierarchy. I would be
doing the same thing if I had done a merge. Actually, it is a merge, but I
do a "fast-forward" merge since he's the only one modifying the topic
branch. And it would look funny if I had done a merge, and then send the
same merge to Linus, where we have two merges back to back. Hence why I do
a fast-forward merge and use his pull request commit message in the one I
send to Linus.

-- Steve

