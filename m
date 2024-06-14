Return-Path: <ksummit+bounces-1267-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D090C908D57
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D20C28C59C
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F63BA33;
	Fri, 14 Jun 2024 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E0lY+Y0R"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29EE9441
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375175; cv=none; b=UQ6deBY33nn6trR5sb2qfV3l5XA7eXyKc/64UPtDN07jQH9yAmHj5SV+FdDFetA3oMP0Qs54wIdT22oviTWH0qIVLucyXTYm8TKbTaDd+fISDu+M4YGJf0vISU+6QPhHJZtyfInybCbykzb0h4Yvpc9WOPu225apKQdDRQffTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375175; c=relaxed/simple;
	bh=QsAtmFDSTKHkH1C752cdE17yNHlSQh76wv+Z1vlj90U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8FZs9Iub1v54MTYr0mPQTejBBzrSg1cDBPWfDjPTlNVyIJ0kePBHzg1UVfy2Es8b/UZUNzYu0IK0fhYZVsa2c7Z/jz1sA+wt+maN2MqtbPGSnfj73GLjSojkUu5aeiDE32k9JUj24QrHMCzepZ2/3CDuWXVNFWU6olfluf5pMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E0lY+Y0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672A1C2BD10;
	Fri, 14 Jun 2024 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718375175;
	bh=QsAtmFDSTKHkH1C752cdE17yNHlSQh76wv+Z1vlj90U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0lY+Y0RAxHzAbYZ3KNXUDD5ResfdQgWl2x3cYgcOACNexaM6PclH8q8lvAg/L2w8
	 mAZyMgRr6dzhts5Olrxu9sb1dza8D2gcOC21+qBAqmFgs9rC16J9qTWDxzZ/TYgXzq
	 25EnHO7+Ze5VGUK2KqcpHP5o76uI6h44ye5s3jgY=
Date: Fri, 14 Jun 2024 10:26:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614-offbeat-talented-warthog-9c3de7@lemur>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <20240614091949.GB3029315@google.com>
 <20240614-quirky-watchful-fulmar-a9bc50@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614-quirky-watchful-fulmar-a9bc50@lemur>

On Fri, Jun 14, 2024 at 08:27:30AM GMT, Konstantin Ryabitsev wrote:
> On Fri, Jun 14, 2024 at 10:19:49AM GMT, Lee Jones wrote:
> > > 1. disambiguates Link: trailers so they point to relevant online discussions
> > > 2. allows tooling like b4, patchwork, etc, to reliably match commits to
> > >    submissions for the purposes of better code review automation
> > > 3. allows stable and similar projects to better track series grouping for
> > >    commits
> > 
> > Sounds good to me.
> > 
> > So `b4 am -l` should be replaced with `b4 am ?`.
> 
> You can still use -l for this by adding this to .gitconfig:
> 
>     [b4]
>         linktrailermask = Message-Id: <%s>

I also just added the -i flag, which will make it into b4-0.14, so you'll be
able to run "b4 am -i" to insert the Message-ID: trailer instead of the Link:
trailer.

-K

