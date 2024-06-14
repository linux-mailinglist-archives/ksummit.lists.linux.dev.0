Return-Path: <ksummit+bounces-1271-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805EA908D9F
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692711C22328
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709FAEAE4;
	Fri, 14 Jun 2024 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1u8A0hFB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832D15E8C
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375894; cv=none; b=cvWMQMujV2/8ZKuRX/XsxI+T19VWO0RAelptJIggoGHSSThj+wFoU9KQw/wEaOLbMybjuTShDSZwKNjmwtz7T5ua+F/i34EgsWAwAIlTqzhUkMLoIIJDcm+8be8r9fgO0P7lbSay9qGyOM2wBRqGUBwDiq/ps1gv6/iaTwmeovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375894; c=relaxed/simple;
	bh=raIEy4gWaQTYWTBvXV6luqKb9WbhmHAFcKPWYzoGJlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnhKeKN+2iEp69UZ1n5j76YiGn3erB12kDPYUjE1SSZYLFnjb4EWqwEix+bk8KVn2J08xGobhPvw2WmNWcyQNdS6zXojd0DkXfwPNjVGaxSl+WGN9grvs1HNH4dx8ELBB5pAcdXK5hM0cA36YOs39SvG4LBSjX0YOvVvgeaTNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1u8A0hFB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61930C2BD10;
	Fri, 14 Jun 2024 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718375893;
	bh=raIEy4gWaQTYWTBvXV6luqKb9WbhmHAFcKPWYzoGJlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1u8A0hFBP49NlKHw2l0Tsgws9q2x14sd15FrnC+L+nY+r5APYVu3kWHCHAftzt9TJ
	 HTYYbMlz8jJTF0cb85BWtmVuRuC6HvvcrUxq3N6YIa9okrw1XqvDqleLhB5cX/i69Z
	 tVgVQYnqHZY7K1gp/XLRoQe0r8lUbtIvEQEldzjo=
Date: Fri, 14 Jun 2024 10:38:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614-almond-lorikeet-of-reading-6d959f@lemur>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87plsjoax6.fsf@mail.lhotse>

On Sat, Jun 15, 2024 at 12:29:09AM GMT, Michael Ellerman wrote:
> > 1. disambiguates Link: trailers so they point to relevant online discussions
> > 2. allows tooling like b4, patchwork, etc, to reliably match commits to
> >    submissions for the purposes of better code review automation
> > 3. allows stable and similar projects to better track series grouping for
> >    commits
> 
> Message-Id: sucks, I want a link I can open with a single click.

But why would you want to, on a regular basis? Viewing the series submission
has got to provide near zero useful info -- if it was accepted into the tree,
then at most it would have a couple of stray code review trailers.

> At your suggestion I switched to using https://msgid.link/ as the target
> for patch links, eg:
> 
>   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au

This is still my recommendation, but it doesn't stop someone from using
msgid.link URLs to link to actual discussions. It also doesn't solve the
problem being discussed here -- reliably mapping commits to patch submissions
for the purposes of automation.

-K

