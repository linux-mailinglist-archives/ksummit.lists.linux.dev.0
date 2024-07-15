Return-Path: <ksummit+bounces-1419-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D53931780
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9C29B21119
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A25D18F2F3;
	Mon, 15 Jul 2024 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhEpFoAv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776751DFFD
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056776; cv=none; b=kbSJpNWfpNfz3q0ps5wR0prWGsI5scWtZagus4Jqww8ONE28n6T+iFqL2ezwG7/cfrGjaiZeaWoZQEqeAXX5eCrNMW+z8EhB9RQBxIkcxxibHiZQiUbnM00Oq55iysb8AzJqCB2khg5sJQj9j5XJWQcSVCfuQVi7oghIgpL6n/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056776; c=relaxed/simple;
	bh=Y7oOxfVlPwdpx1VRZmChMbyYi5zgn2j5cYC8K/9iUDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTzSm721y0E0Mp6jBzWGJy9PoJYjxprFYvRTARwNqG3g0ixhV2IkvxhMhrH/UcIoWDF5A7h0oeOmvMcNfihPb8hQmW3OhlY7QkR+ON+Z0WfAtlhwqNwpDjND/kAqaJmfSzc0ltzFBAD1WXIU9zYUp1dhsrW/2Xnt9CjlYxdmL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhEpFoAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1581C32782;
	Mon, 15 Jul 2024 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721056775;
	bh=Y7oOxfVlPwdpx1VRZmChMbyYi5zgn2j5cYC8K/9iUDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhEpFoAvPM9EaNUiuWJO2yTguUCfF1Yx1Kfelt1CjLwKaRkxGbbIeXtsIVDEv4wPk
	 G0fyWgi1zfYQSzRzCPzKF8Sc454RJS0wH6masTroDwE2YXEFzcH1SsCXTdMK0KbswD
	 6lZlPov6DSrS/OdiMFrRpGVyHagUFz+NyKrUcObOyFGnhoAOjUS+MzWb1PYcXZSNHv
	 jaG23fAZlMwCW6qE0PqVjWqeDBnacAxA9fv3BPYMwY475c3viwG83w/NnGqLWxL023
	 0OmgYFSlxYS9GO4uriRY+mvPvgM6JBSazyOcOVWmb5Yt2n51qLCC8Dk+57c5Kt2ioy
	 grz4M7ZufH5kw==
Date: Mon, 15 Jul 2024 11:19:31 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpU-A9avLDktkFT_@sashalap>
References: <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <87h6cqya32.fsf@trenco.lwn.net>
 <b71b6745ae79ae40196d82c0c306acdc174c0994.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b71b6745ae79ae40196d82c0c306acdc174c0994.camel@HansenPartnership.com>

On Mon, Jul 15, 2024 at 11:07:30AM -0400, James Bottomley wrote:
>On Mon, 2024-07-15 at 09:00 -0600, Jonathan Corbet wrote:
>> Are developers and maintainers expected to put in stable tags the way
>> they are expected to add Signed-off-by, or is it a fully optional
>> practice? In the latter case, I'm not sure how much good messing with
>> the tags will do.
>
>So what's documented is
>
>Fixes: is generally useful outside of stable (for bug tracing and the
>like) and is thus not optional.  It simply means something about the
>target was updated by the patch, but this could be spelling in comments
>or white space and thus may not be a stable candidate.

But then look at how folks interpert the Fixes tag:

On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
>I would hope that *all* commits improve on something. And if it's an
>actual fix to a previous commit, it should say so.
>
>If it's just a random improvement, it shouldn't refer to a previous
>commit at all.

Linus (and others) see the Fixes tag differently than how you (and
others) see it.

Which, I guess, is the issue I'm trying to resolve.

-- 
Thanks,
Sasha

