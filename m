Return-Path: <ksummit+bounces-1437-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC493206F
	for <lists@lfdr.de>; Tue, 16 Jul 2024 08:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD651C210E0
	for <lists@lfdr.de>; Tue, 16 Jul 2024 06:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571EE1BF31;
	Tue, 16 Jul 2024 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="udfW2jEs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDACE552
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721111418; cv=none; b=aXP8EcofnWRzjmO3wbfO5e38khx4UYvQIefVYtpCp/5MVl2ML+kr/Pc2mRp4mcZDNuchj7wFhWXC2DyjSNv0uaJFYQnT2SU/eYjG164jeT6Ra0cWORZiyljdxfmZe08o8wAHD6EbvjATA8DzG1BQ0dT+1z8WbGQWQecyhfcZt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721111418; c=relaxed/simple;
	bh=Fmr1NnhSMdl8nSsMJs3YcMT+P8QG7/utPgjjA9jJIwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvAp2NTniHeYXt2C1nDsntO6nT1tz+QvwVX5KZt8KQgb3YRr8M7M1IizaMqWmFHTywwFZJ98F0Z7uqqe49wfgyY5uvZQ72+VdxYjRFUipviwm8EkBGP//P0mSD7lZvM7ZcF1kDgMglilJ3fvAVrJXJBYtX1MAdzsFGhDY05ykwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=udfW2jEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A0DC116B1;
	Tue, 16 Jul 2024 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721111418;
	bh=Fmr1NnhSMdl8nSsMJs3YcMT+P8QG7/utPgjjA9jJIwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udfW2jEs8yd4gUWqbDG5Q+VhIilwsp5Ft0PPAfj/g98Ta9QXe02BKarczVDL+FEpJ
	 K5pi310W6OyMNU5JHRjuWclbTdCAVFhk0bSl8UkdYwIjfwpk0hN2hL4O5JeUC2GI+Y
	 TkX0qfPjbeDuhJtOB6DUORm51UwexrsN+URAhngo=
Date: Tue, 16 Jul 2024 08:30:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071623-obnoxious-agonize-ecc4@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
 <958a9ad7-6758-4f3f-807a-e44972b5ef95@suswa.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <958a9ad7-6758-4f3f-807a-e44972b5ef95@suswa.mountain>

On Mon, Jul 15, 2024 at 02:39:59PM -0500, Dan Carpenter wrote:
> On Mon, Jul 15, 2024 at 03:24:42PM -0400, James Bottomley wrote:
> > On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
> > [...]
> > > The one question I have is for patches which pre-date git.  I was
> > > told to leave the Fixes tag off in that case, but I think that's out
> > > of date. It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> > > rc2")".
> > 
> > Actually, we have a history tree (based on Bitkeeper) that goes back
> > before that:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/
> > 
> > So I'd tag these as
> > 
> > Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")
> 
> I don't think most people have the ancient history so would just confuse
> people and break scripts.

Yes, as an example, it breaks mine which I use to find out how far back
a commit should be backported to.  For the above, it gives:
	Could not get sha1 for 3bc0a5f5c1. Skipping.
as an output :(

thanks,

greg k-h

