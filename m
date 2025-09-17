Return-Path: <ksummit+bounces-2409-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C50B811DD
	for <lists@lfdr.de>; Wed, 17 Sep 2025 19:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CB94A464A
	for <lists@lfdr.de>; Wed, 17 Sep 2025 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A563C2FB635;
	Wed, 17 Sep 2025 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tsyazxy5"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42DE2FB094
	for <ksummit@lists.linux.dev>; Wed, 17 Sep 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758128605; cv=none; b=H2q0ZEcx9oMh58U/UZBXILWmVBoPLapP+uZaCUHJ9voM2xNLbcoFapV//WiOnIa14YX9vt2ZvpbyWkqz0qSg412hHPQonQ4UGaX4D5FBSIoqGnHaZOT5LlFirgmwMsNRtDfez6ouf0oh3YFVUg7KSZ7M4nGFenVcEzwis0zqW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758128605; c=relaxed/simple;
	bh=AP4RATmgy0jxhMayzF6BrbMxavdECknuH9Hg7XagckU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/yFRAZTjKd7oZF70c3hNK4d9WG79lKENFkmvJMNcmTbVFBhLqAkqe8oya0lkI8J79ydT2ozwLdHk15naRnuW9wKSfBbdficDR0oVxp8EztJHvtwCQJ3UFcpL2EqaYOEJXwLGtDR6F/7VWX/IqMdgi6CCEujk45zeCEZc6ZViGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tsyazxy5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 20D276A8;
	Wed, 17 Sep 2025 19:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758128520;
	bh=AP4RATmgy0jxhMayzF6BrbMxavdECknuH9Hg7XagckU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tsyazxy5iBe3oByb9lBs7e+3xAFjf0zWafy9sBAR7q1YAQU5XjdF+fsYF5faP2p9G
	 /C0wXuYV7kLH41+DnDdV/5EHfwLiFLqg2M53wnJ8j+AybQDiS7XhszXzLf+rxiKyX4
	 uEVVXx8JhvPi89+QM454kISO3UbRHbfTA7fV/txQ=
Date: Wed, 17 Sep 2025 20:02:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kees Cook <kees@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250917170250.GB10145@pendragon.ideasonboard.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <202509151019.CD7AA0C0BE@keescook>
 <20250916102022.5bc75a36@gandalf.local.home>
 <202509161626.AA26A66@keescook>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202509161626.AA26A66@keescook>

On Tue, Sep 16, 2025 at 04:30:30PM -0700, Kees Cook wrote:
> On Tue, Sep 16, 2025 at 10:20:22AM -0400, Steven Rostedt wrote:
> > On Mon, 15 Sep 2025 11:01:46 -0700 Kees Cook wrote:
> > 
> > > So, what I mean to say is it's certainly useful to declare "I used a
> > > chisel", but that for long running sessions it becomes kind of pointless
> > > to include much more than a general gist of what the process was. This
> > > immediately gets at the "trust" part of this thread making the mentioned
> > > "human understanding the generated code" a central issue. How should that
> > > be expressed? Our existing commit logs don't do a lot of "show your work"
> > > right now, but rather focus on the why/what of a change, and less "how did
> > > I write this". It's not strictly absent (some commit logs discuss what
> > > alternatives were tried and eliminated, for example), but we've tended
> > > to look only at final results and instead use trust in contributors as
> > > a stand-in for "prove to me you understand what you've changed".
> > 
> > I don't think anyone cares if you used AI to help you understand the
> > situation or to test your work. But if you had a robot build you the fish
> > and you handed that in as your own work, that would be deceptive.
> 
> Right, but the LLMs aren't used strictly as a "workflow" assistant. Do
> we want to say "I used the chisel to remove a big hunk of wood you can't
> see at all in the fish."
> 
> Perhaps the issue is to just over-explain when the LLM is in use for
> now, and we (as a developer community) will collectively figure out what
> turns out to be unimportant or redundant over time. But this can't be
> done with a trailer tag: we're going to need relatively verbose notes
> in the commit log.

This conversation has gone in many directions, it seems to be time to
try and refocus. One way to do so would be to focus on *why* we want
those annotations. That may help then deciding how to best annotate
patches to reach the intended goals.

Personally, I care about knowing the possible LLM origin of a patch for
two main reasons:

- From a maintainer point of view, to focus my reviews. I will look for
  different error patterns, or will interpret patterns differently for a
  human author compared to an LLM.

  This mostly focusses on code produced by LLMs. Usage of LLMs to
  understand an API or review a piece of code before submission is less
  of a concern.

  I don't specifically need a commit trailer for this purpose, a
  free-formed explanation in the commit message would be enough. I would
  rely on trust that submitters will be honest there, the same way we
  rely on trust that a submitter has no malicious or selfish intent in
  general. We of course stay alert to detect breaches of that trust
  today, and I wouldn't see a need to change the process there: we
  already deal with situations where a submitter is determined not to be
  trustworthy.

- From a legal point of view, to detect code that may not be compatible
  with the GPL license. This is still a legal grey area, if we want to
  accept code generated by LLMs without waiting for courts around the
  world to make clear decisions, we can't ignore that there's a legal
  risk.

  For this purpose, a commit trailer would be useful, in order to easily
  list affected commits.

-- 
Regards,

Laurent Pinchart

