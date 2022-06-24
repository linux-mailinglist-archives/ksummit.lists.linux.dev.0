Return-Path: <ksummit+bounces-705-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5D55937E
	for <lists@lfdr.de>; Fri, 24 Jun 2022 08:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E2D280C74
	for <lists@lfdr.de>; Fri, 24 Jun 2022 06:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869AC23B8;
	Fri, 24 Jun 2022 06:33:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047E1FD1
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 06:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFCDC34114;
	Fri, 24 Jun 2022 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656052393;
	bh=TEXU7JH+YFBNeeNYZ37T5sS4xSHE8t3dVJBTFe7B0vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w3XpcyFfu0yYC0LyrqniarPgz6fa8ntXQUhnmvZZYdyfbs/zjAroLtLPcoW4NUXPE
	 5FVFFXSfeCb9cmB3kRXjANp9JL8cEhdiGr9ktA9LUto18KhZ4Y+jwlnrct2YxgBIuo
	 bfCD4pkFvwylW/kIL0X2vCqudWFnTJPBqymvJWq0=
Date: Fri, 24 Jun 2022 08:33:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
Message-ID: <YrVapQUhg4PVEw39@kroah.com>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
 <a3de118e-1ef8-ac79-cf0c-e5e55a1238c8@linuxfoundation.org>
 <YrT3niddXMfuTWnT@pendragon.ideasonboard.com>
 <6c4867fb-9020-ba64-427b-556e5f004a27@linuxfoundation.org>
 <62b4fdd7c4183_8070294ad@dwillia2-xfh.notmuch>
 <YrUMlki+cJkJ3R/X@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrUMlki+cJkJ3R/X@google.com>

On Thu, Jun 23, 2022 at 06:00:06PM -0700, Dmitry Torokhov wrote:
> Nor does this work for drivers for devices that might be hot-plugged,
> instantiated via sysfs/new_id, etc, etc.

Agreed.

> So if you want to fail driver registration because you know that you are
> dealing with a singleton platform device with no additional dependencies
> then it has to be done in the driver itself, not by the driver core.

And even then, it really should not be done in the driver, that is not
how Linux drivers should work at all.  That's why we have macros to make
it so that module_init() just calls [SUBSYSTEM]_register() for the
subsystem in question, and the module is not supposed to do anything
else.

thanks,

greg k-h

