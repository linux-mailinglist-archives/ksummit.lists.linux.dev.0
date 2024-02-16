Return-Path: <ksummit+bounces-1209-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B0858421
	for <lists@lfdr.de>; Fri, 16 Feb 2024 18:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4DB1C229D0
	for <lists@lfdr.de>; Fri, 16 Feb 2024 17:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A00A131E43;
	Fri, 16 Feb 2024 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UBTnmawO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA08130AF6
	for <ksummit@lists.linux.dev>; Fri, 16 Feb 2024 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104880; cv=none; b=Jx4BFzCUEBq8+naF7vAKw+13Ks5BdGeTquSiLND/OMOcKJanPoXkaH1lITGlIeO7bbpQFXC3+cWXODKWxz4aE6yZU7VMVMxYhvYt5l9e6XNgDVre8vjIrSdeDlm+egBWGahV43MX53xlYUFsCMWR9b54YC3D+VJ4TIvBI0+QwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104880; c=relaxed/simple;
	bh=D7a9p84mHLu9c8fG4q0/XyjzSfGY3ZyKGeNOXkRXFa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJKPH9gdjmupQOVu5WOK4drJqi/Dlh8LY9cOhgU8M9E7OJDh8PNLqDFV8fxMha4ZhoW3xsMYxnS+6k1hHA11OWII314GVIDJxi9KuPGm9+LceBxzNVPO4LX/krMVdADDxf04yjYqaPGL8mWAsBIWKdD0isyDlU9m/EzciAA6a4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UBTnmawO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA85C433F1;
	Fri, 16 Feb 2024 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708104879;
	bh=D7a9p84mHLu9c8fG4q0/XyjzSfGY3ZyKGeNOXkRXFa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBTnmawOlxm8jIaVD2Ku/dhy+lZ6PUnbepYvggmVYmpMo2wBJVuGxJRMCPevnlwvk
	 FQMsaoQD9ILOaWnshD0gKkuk1QXzjOmcvoxikNy+GNziitVgNMoEyKg5mC6RdVTBMx
	 Oef3HLVtgvkay9eLYD3WnOsh8Igv3uDrobcOgP0g=
Date: Fri, 16 Feb 2024 18:34:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jikos@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2024021634-starlit-waviness-c329@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
 <20230815183120.0c92a759@gandalf.local.home>
 <2023081641-unstitch-kangaroo-a2c1@gregkh>
 <20240216171427.GA9244@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216171427.GA9244@kitsune.suse.cz>

On Fri, Feb 16, 2024 at 06:14:27PM +0100, Michal Suchánek wrote:
> On Wed, Aug 16, 2023 at 04:55:39PM +0200, Greg KH wrote:

That was a very old thread, why dig it up now?

> > Together we were able to solve the "impossible" problem of Android
> > kernel security.  Now that that windmill is semi-successfully conquered
> > despite many who thought it never could be, why can't we help other
> > users of our product to do the same?  If not, we run the risk of having
> > Linux be blamed for bad security, when in reality, it's the policy of
> > companies not taking advantage of what we are providing them, a nuance
> > that Linux users will never really understand, nor should they have to.
> 
> The real impossible problem of Android security is that those Android
> systems aren't really opensource, and it's (next to) impossible to get
> updataes when the device vendor does not provide one.
> 
> So many Android device users are running long-obsolete systems because
> there is nothing more recent that runs on their device.
> 
> That won't change no matter what stable does or does not.

That is why governments are making laws to require this to happen.  The
EU just did this for all mobile devices, and I expect other governments
to do the same over time.

thanks,

greg k-h

