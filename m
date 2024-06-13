Return-Path: <ksummit+bounces-1240-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EA906AE2
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7370B28704F
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AB9142E8E;
	Thu, 13 Jun 2024 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QVGOSdRZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71D1422DD
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277678; cv=none; b=kNbUzittB/iJUIvEC29MudhcBb+ZuXmgIiTGWtj6rzR3fHY+w6Z6lCNoQ0vX1cxx2sAvG8esgX31kGB7pY/xBDsj5ZNeOe8oxvsBzyuSfAvbSWjdNbmQ3U4W3/5uhbo9fWFDoRUA7fiqPnr12JW3m2DR4UbnGF0T4U53SylRtlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277678; c=relaxed/simple;
	bh=OaUQZu91pRIS675ZKfEojsCoS+tC5Y6wBIw4ObxN6jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm8lREauD7xvm6a/ToP771y7tKTyn5MLp5rNSMV0ZvmprfPKuI6nr6AqrsiNx78BMwkh9i+fw/wGHxAilB/mvNMvMIvUunSUj8zMZkjzu8wJng5hqVxK++L4Qx+UsYuJQT6bgY+On6nQIkq6jSi7ij5azw6ayhIztbKQKKVRXDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QVGOSdRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F01AC2BBFC;
	Thu, 13 Jun 2024 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718277677;
	bh=OaUQZu91pRIS675ZKfEojsCoS+tC5Y6wBIw4ObxN6jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVGOSdRZsGiayFdNoP/71K5B5qZHJu4X6W90zytvKClMFhP0WWbThLi9amoieWQU/
	 tz5qieV7yYusvvz0OHaJtdI5tMVdIVZVFkX1txKoqZq6HTxEDRDHlOeumkZdKyL9Pw
	 4fhdo/zXIEgu2Mgysy+Gn5ELHyuLPZ7nuZU3PiUA=
Date: Thu, 13 Jun 2024 13:21:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
Message-ID: <2024061332-amazingly-haggler-de9a@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
 <68ad780601dd5788ab7c18e8ba683e808cf98f4c.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ad780601dd5788ab7c18e8ba683e808cf98f4c.camel@sipsolutions.net>

On Thu, Jun 13, 2024 at 01:02:44PM +0200, Johannes Berg wrote:
> On Thu, 2024-06-13 at 10:32 +0200, Thorsten Leemhuis wrote:
> > 
> > I know I'm asking a lot here, especially from the file system folks due
> > to the testing this will require. And I fully understand the
> > participation in stable maintenance always has been and still is
> > optional for mainline developers -- and that this would change it.
> > 
> > But I'm bringing this up anyway, as users afaics expect "fix recently
> > introduced problems with new minor releases'
> 
> You are saying that users can have it both ways: not test each release,
> but actually get fixes in each release...
> 
> So no, I strongly object to putting *even* more work onto maintainers,
> basically making us all responsible for stable releases.

I also agree.  Remember, the FIRST rule of us doing a stable release at
all was that we would NOT put any extra work on any maintainer or
developer that did not want to do anything extra.  Let's not change that
please.

thanks,

greg k-h

