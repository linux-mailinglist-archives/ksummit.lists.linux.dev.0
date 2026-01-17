Return-Path: <ksummit+bounces-2780-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1DD391AD
	for <lists@lfdr.de>; Sun, 18 Jan 2026 00:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B58003014107
	for <lists@lfdr.de>; Sat, 17 Jan 2026 23:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442412E8B75;
	Sat, 17 Jan 2026 23:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmvwPfZ9"
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639382BEFF6
	for <ksummit@lists.linux.dev>; Sat, 17 Jan 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692766; cv=none; b=qBf6/Qb2kd+9udtRK1z5GxZaj6otuVOdORDeJkPDOOCbRGPSvfDpagwn2otPxzq+tcuXGqJFN83DmaU0/ERj9RGNHe+TW+34r291JKLd+ti4u13E2zm0TdhhkXxfd4NGJRaAUnU+1jaY5tkGZarIZ4Eb08diPkS4CyW1lqkhw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692766; c=relaxed/simple;
	bh=tswY9sr+6D0K7NCsWgYHjxJJImhSdxWRig3FrPEYGLE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPy4+1CHIo9J3awi4tSODL5n9DVpIJJDNe06oOpOi/klja5XNhM9JoWGsgcfacYxnqVxBGAYyEOVfb2U0egY6VzHraGEs1aDD/Ks/DhUGrI5yVx1HkqiUPupYEUn6WyCJ7a/sXPZInIz/4oJmEssFHN/16h7Z2J8S8pachbvizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmvwPfZ9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801c314c84so17652945e9.0
        for <ksummit@lists.linux.dev>; Sat, 17 Jan 2026 15:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768692764; x=1769297564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXyjAWiL9FfOIdQk6OYLsAjwy2W6lQPX58xL+qrHaN8=;
        b=RmvwPfZ9xfDU/dN/My3JqZ4BNCBIAxVW4ADib1fMA98kPsfvNXmDBZhpcbo5m8ZFDm
         74rWP76EJWW3sT2X/yWdxgZxu87dD/K46g3FvMmIyIvVqj8MK2orWdBwUyJvIldJXd9K
         gSKFi0arY7rtFbLXIOektRbd7G+UP7DYaV9o5jem3aAueHUCoGNcAPW3YwSh+js8ZvuA
         P7eCBoJEHvfHZyUfTymEhkCTcNJjFpSe6BLAh12mWAbWcqhp/dpInPOvZYJ8hnj/1OGF
         5wnLsh8p4vFfz0UHDJVK0KA36oTlNBVAc/ADyE14W9lRYiCKrmW55avLuyb1KPd/L+g3
         B8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768692764; x=1769297564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXyjAWiL9FfOIdQk6OYLsAjwy2W6lQPX58xL+qrHaN8=;
        b=xNgQkyNLsdlaQGHSSa7i2BPeN9c6zl6uEqbNFyjFL/1nzrFha2QuepQyCydtzVONa7
         r4v2aoOe4+LWdwTPWHtKjM2Cm5nU68D61BPbzIqB3DjtqLC1XF5C4OQHkc62kOaNRY12
         mbXBuIVNuACllCaF2JprSWfC+jINzZxWJSXQGShWWb/Cnqs/6ejFyGKI9/CJAixXmQHI
         5YUeyxkr3q9jelraR6K0anaX19pOmtyUGsPbzOLwc6s+EHJoph3spxVNj7WrxhYSXnx1
         o1iysPOCeIvcP5WOrvP9HgDOME3UrX8u5D1mWOthVxt4CZuiYtSmLt0+P3eotqZuwujt
         x38A==
X-Forwarded-Encrypted: i=1; AJvYcCV6aEYFCb617M4IkxED7+AWTrRHJPf5nvZehTm99PbjUJ2Y6Xeqt0+XicC6lnSKv/4ZCvLrYBpY@lists.linux.dev
X-Gm-Message-State: AOJu0YwS1b7sUabTKuAHcIC25l5aQznRSY8hrzwCA2m4rSSApjqJdUpn
	bV0LUYR1t8GPJFqEydZJVdvtlTe/VAVPNihREf0CyZTPVw0aUIWSfnO6
X-Gm-Gg: AY/fxX5w/4jo0qQvj6YeJe5QfQmQYjU/2Y23xqeMLC5XXK4N4oLD2JddQGxL3Ga7bsC
	/YCWbVjBvvv77CDv96Da63dWkUVE3s20ZjJoSKe1BmjqXhW99hiQTO/O8vD7XPQBH9R7EM6UMVt
	awSVKtLn9AauverpXkO7GVqEa9w94M+3uLqQOLZ1T2v2VTYbbJbcCz+WxBXj99Qs6+5FWWrlUv6
	5nr6PNZAp35gjn7nKSH+wX/IC3Dnf9HFdBeGgb4zVFCMGI2M77iP3Gskz1Qza/Dq0lFir4/KhM0
	W8zFrb4h+G7djZEUbtBuaVzY9BDBZgs8GohLAa5FL7wIMfQQvVkgVYtGU+oN1fS/HbHglU2nGn2
	46wY7Q/uV6+P+fAOkXH6+OsQc3A9/EFKOTUk7nDa9Ob9xPM3k6gerRFTEZvWLWxPsxzg83Ci3Fj
	oivsIBH7mL07wSxjv+RJ5xHz3qD4McGCSm0VIVO4DFB4Hj6D+pv1ykJNG5G6nc6IU=
X-Received: by 2002:a05:600c:b93:b0:480:1db1:b44d with SMTP id 5b1f17b1804b1-4801e34cab5mr95807995e9.27.1768692763561;
        Sat, 17 Jan 2026 15:32:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm211685415e9.15.2026.01.17.15.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 15:32:43 -0800 (PST)
Date: Sat, 17 Jan 2026 23:32:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, James
 Bottomley <James.Bottomley@hansenpartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan Williams
 <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20260117233241.5ba95b2d@pumpkin>
In-Reply-To: <PH0PR13MB5639535AC3D1232831FD2380FD8AA@PH0PR13MB5639.namprd13.prod.outlook.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
	<aVUUXAKjiNroU5tR@black.igk.intel.com>
	<20260102095029.03481f90@gandalf.local.home>
	<38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
	<PH0PR13MB5639535AC3D1232831FD2380FD8AA@PH0PR13MB5639.namprd13.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Jan 2026 16:54:43 +0000
"Bird, Tim" <Tim.Bird@sony.com> wrote:

> > -----Original Message-----
> > From: Alexey Dobriyan <adobriyan@gmail.com>
> > 
> > On Fri, Jan 02, 2026 at 09:50:29AM -0500, Steven Rostedt wrote:  
> > > On Wed, 31 Dec 2025 13:17:32 +0100
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > >  
> > > > > There was variation of this type of nonsense with headers (not only it has
> > > > > to be sorted alphabetically but by length too!)  
> > > >
> > > > By length it indeed sounds weird, but alphabetical is the natural language
> > > > order everybody learnt from the daycare / school years, so it's properly
> > > > programmed in our deep brain. Having that allows to find easily if anything one
> > > > is interested in is already being included. Also it allows to avoid dup inclusions
> > > > (was there, fixed that for real). So, it's not bad.  
> > >
> > > Actually, I like the "by length" because its aesthetically easier on the eyes.
> > >
> > > Alphabetically is fine, but either one helps in catching duplicate headers.  
> > 
> > Such rules for headers are mostly harmless -- headers are supposed to be
> > idempotent so ordering doesn't matter. But if ordering doesn't matter
> > why have a rule at all?  

> The rule is (or at least was, at one point) helpful to reduce the likelihood
> merge conflicts during patch application.  I know patch and quilt still
> don't ignore mismatched #include lines in the patch context, even
> though #include lines in C are independent of each other.  I'm not sure if git
> handles this better or not.

I prefer headers to be grouped with system headers first, then subsystem ones
and finally local ones.

Alphabetic ordering is, IMHO. silly.
If you know the name of something you cam search for it.
When you don't know the name you want it to be near something you do know.
So in a book on a cpu instruction set you want all the arithmetic
instructions next to each other not spread throughout the book.

For C variables you want the definition where you can quickly find it when
looking at the code.
Hiding it in the middle of a large block of statements doesn't help
(especially if -Wshadow isn't enabled when you might find the wrong one).
If a variable is only used in a very short block, it can be defined at the
top of the block - otherwise it really needs to be at the top of the function.
But don't initialise things that aren't semi-constant and are only used way
down the function - that just makes you have to go hunting for a value.

The location of these definitions has to be about making code easier to
quickly read.

	David

> 
> When everyone appends new #include lines at the end of the block of lines,
> there is more likelihood of a patch conflict right there.  If the #include lines
> are instead sorted in some fashion, it reduces (but obviously does not eliminate)
> the possibility of a patch conflict.
>  -- Tim
> 


