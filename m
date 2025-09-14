Return-Path: <ksummit+bounces-2388-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A35B5671F
	for <lists@lfdr.de>; Sun, 14 Sep 2025 08:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD01F7A79FE
	for <lists@lfdr.de>; Sun, 14 Sep 2025 06:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678161D54D8;
	Sun, 14 Sep 2025 06:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W6xphTWP"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564E8C11
	for <ksummit@lists.linux.dev>; Sun, 14 Sep 2025 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757832348; cv=none; b=jaiRpYc925TxaG6MEi7o5CAWfObzNFPwQjMDeENs/KFrVUi0Y8Fj+uyty10Dp3JqMYBSXs5gICxeHxB8Iz9pLL+V7whu0rYgRMrY9LcQjeaoulL2nmGpzqekj79teljzycqvtwxqgqPkMa8zBn6m0BVTQlj41v9beNWF8cKBVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757832348; c=relaxed/simple;
	bh=BCr+ls0An2/5TRnczWc7PJCJ5H06iCwCsKsIrRFhug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeFLrFzY630aBAmZ62qMBtOjnn1bbn2kaueVjSZ/40aebYBALVIJ7bAAiInJLD0lXVzSxhPL6zAt71YE8r0w7ojJYG0RB/ggsOO5PxMrrrog6sxO6tcs3CKU8EgH/mWtaO0zlbaXxyQUcSlkmkVq+h5zSUcb1TlZx0gzMuDsWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W6xphTWP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8CAC4CEF0;
	Sun, 14 Sep 2025 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757832348;
	bh=BCr+ls0An2/5TRnczWc7PJCJ5H06iCwCsKsIrRFhug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6xphTWPTGtXFZPZQarmGoulcd7hMsYYl6co45SH8pvuMauSICI5PJuyf/pkXhJs/
	 IPffNkogB18Dh9pCYESdb9aFM9y6dO07GDG1SB6BQ7RSXmCVfVLJ9/D3HtQeekW6wd
	 kqSOTrqx4ZgIILuM7/59hocCeyaot+/6YvdZI63Y=
Date: Sun, 14 Sep 2025 08:45:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Revocable: a mechanism for preventing "classic"
 use-after-free bugs
Message-ID: <2025091401-elm-undress-03d6@gregkh>
References: <aMWEhqia_jpl12uI@tzungbi-laptop>
 <9q6poo2r-9589-45n8-037n-q75348021s34@xreary.bet>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9q6poo2r-9589-45n8-037n-q75348021s34@xreary.bet>

On Sun, Sep 14, 2025 at 12:19:47AM +0200, Jiri Kosina wrote:
> On Sat, 13 Sep 2025, Tzung-Bi Shih wrote:
> 
> > Abstract
> > 
> > A "classic" Use-After-Free (UAF) can occur when resources tied to
> > hot-pluggable devices are accessed after the device has been removed.  For
> > example, an open file descriptor may hold references to such resources; if
> > the device is unplugged, subsequent file operations on that descriptor can
> > trigger an UAF.  This talk, a follow-up to a previous presentation[1],
> > explores an approach to this challenge.
> > 
> > We will present "revocable"[2], a new kernel mechanism for resource
> > management.  A revocable allows a resource provider (e.g., a device driver)
> > to invalidate access to a resource from a consumer (e.g., a character device)
> > when the underlying device is no longer available.  Once a resource is
> > revoked, any further attempts to use it will fail gracefully, thus preventing
> > the UAF.
> > 
> > We will discuss the design and implementation of the revocable mechanism and
> > its application in the ChromeOS Embedded Controller drivers to fix a
> > real-world UAF bug.  We hope to also start a discussion on how this generic
> > mechanism could be adopted by other drivers to handle similar resource
> > lifecycle issues.
> > 
> > [1] https://lpc.events/event/17/contributions/1627/
> > [2] https://lore.kernel.org/chrome-platform/20250820081645.847919-1-tzungbi@kernel.org/T/#u
> 
> I will be honest and admit that I haven't looked at the linked resources 
> yet in a big enough detail, but judging purely from the abstract above, I 
> believe this will immediately met by "how is this different from 
> device-managed (devm_*) resources?", so hinting about that in abstract 
> already might be helpful.

It's quite different, devm_ can be built on top of it, like it was done
for the rust implementation for devm_*, so yes, it would be good to say
something about that.

thanks,

greg k-h

