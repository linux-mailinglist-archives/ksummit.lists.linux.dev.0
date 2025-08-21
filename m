Return-Path: <ksummit+bounces-2185-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA1B302B4
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B57F582600
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E002E88B9;
	Thu, 21 Aug 2025 19:15:12 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6E341AA6
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803711; cv=none; b=QuGH+aPmqD3SXD5c2adye8qiQBmuzZAq4tWV6PHWNYECoS4Ek7vHlWAeCqUVr/OTr98Rob9BbSiuFXek5VxhtYPVzv4aa33Qzs9vJG8DiO8+MP2L3o2AbobN5c0xbP+yqmfE+uyTXlZymwKDogDNYlcEDTsNG3bLsFvCeTJwLVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803711; c=relaxed/simple;
	bh=v9DXLBdAVysgMetYRE1Go8LQdkE/8szQv91HZLHyA7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfI5Dqykm2unNncLgvya3EoEIA/dB2Gig5gdXMB6AqMXEB9/2Joq+Dpr+LE9dVoCyhkXyh1sPO2yTtflFhopo6HmD6cdWhMkalbj2+Za1xd9oAAR/q8XiJWpqxoK8vnpcP7ckQFPTxEPh2u2upWc4z6yLQW3+7hEt9ueoEriPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id D3611117EE7;
	Thu, 21 Aug 2025 19:15:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 3A4222000E;
	Thu, 21 Aug 2025 19:15:07 +0000 (UTC)
Date: Thu, 21 Aug 2025 15:15:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINER SUMMIT] Adding more formality around feature
 inclusion and ejection
Message-ID: <20250821151512.6b42336b@gandalf.local.home>
In-Reply-To: <64ca315de44a6a5d8e5992a67a592b97f12f0098.camel@HansenPartnership.com>
References: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
	<20250821122750.66a2b101@gandalf.local.home>
	<64ca315de44a6a5d8e5992a67a592b97f12f0098.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ph9kqrdt9mm5urqd851hknqwxnkkggss
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 3A4222000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+AD2CcoiU0hmsHn3FS7CFMuWvB/hEIYmA=
X-HE-Tag: 1755803707-560238
X-HE-Meta: U2FsdGVkX1/PNGF+zzWiRNllOOraKWPJbFKKs3pytWrbJ5MaHOJsc+AYKFfe+qMak1aqfSB4fHrCuZ0c8fMTXDjmNDynWwreM9+reBuZ9ejbovF7RIBXYnwo1iatgI3tDsxNrx9LUspY/cTUV4MGUIdWNoeR0Gb/qVzlbb36F9SGc4oByvRlDw3Mo52zKRrwTfcOLlv9lxz9fWJFOvbrH8th18Za3QOhhNdcZKVgjah56J6WydkAxA9VwCuvToKtIi1weysefsYxlMu3g0soSabruaw1cwTeQaITZ/Yg6xMuXAZAvHfSdWC5Bf3OyAyrSQ1GwtvL83ht/LclBhqB2utMWNcS1OM4adJYf8CV7qcCwys4XmVyyGgAS5pSmGEt

On Thu, 21 Aug 2025 18:44:07 +0100
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> > I share my scripts and explain how to do a pull request. How to use
> > linux-next and what to and more importantly, what not to send during
> > during the -rc releases.  
> 
> I'm not sure that covers it.  As I read the situation it was more about
> how you work with others when there are things in the kernel you'd like
> to introduce or change to support your feature.  Hence it's really
> about working with rather than against the community.

What I'm suggesting is to have a program to help newcomers that are taking
on a maintainer role. This program can not only teach what needs to be done
to be a maintainer, but also vet the people that are coming into our
ecosystem. If there's a lot of push back from the individual on how to
interact with the community, then that individual can be denied becoming a
maintainer.


> 
> > I'm sure others have helped developers become maintainers as well.
> > Perhaps we should get together and come up with a formal way to
> > become a maintainer? Because honestly, it's currently done by trial
> > and error. I think that should change.  
> 
> That wouldn't hurt, but that problem that I see is that some fairly
> drastic action has been taken on what can be characterised as a whim,
> so I think we need some formality around how and when this happens.

If it was policy for Kent to work with a mentor before he could send
patches directly to Linus, would this have uncovered the issues before they
became as large as they had become?

-- Steve

