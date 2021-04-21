Return-Path: <ksummit+bounces-25-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA03675A7
	for <lists@lfdr.de>; Thu, 22 Apr 2021 01:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BAC243E2CB1
	for <lists@lfdr.de>; Wed, 21 Apr 2021 23:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735E22FA2;
	Wed, 21 Apr 2021 23:17:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DF2F9B
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 23:17:11 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so40466262otn.1
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qrs9aqhboctOtsALuXm1jUf+eI0h9hAWqqhIoZ7gYy4=;
        b=tArUU8NhTIlwTXaXhaIeuv7M7ELd4663yJsxWrWXSG6H4goSVWbp3KuICTefL14l+Q
         omK9e09MzGrCkiNKLBYtJYKt1j6ylrIPXIwFoLgLjvmCC5oC01cFKtah0Be5pUikqgio
         RHefMVJNxLcCULZrlrQqw2NlYhedmQMGQYVXO47gauQ/ED7RR8Jca/WH8YOnY9DGoAio
         ZH2KykXjVegNnn7htj3LKJnOOBtJ3ZY12Ih8U8b8sKHS1ch2T6ujIjcjcyQ5DEO2Qxvb
         djoXXyXIDs6yHGgqdq6XRYpSbZKNBnulDZ8t1oCXTAavC7YRQWS/HN4XDr68s2kGiE5n
         T9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qrs9aqhboctOtsALuXm1jUf+eI0h9hAWqqhIoZ7gYy4=;
        b=fUe8KcyGgpTyV1aw8oCmD3ivi8hXj1mFkV9gpZ7DEWEOS59rcPv7XkgC7s5iqbzAR0
         sUgK86e7gTS5BFHbxU8HbrEamgznqmXj+1kRJojbi6q+wpqb6uJY7+HD3KqQyYK5AFUV
         sqeWE1SJ7h4S8STjB3fx0iSzXsEMXPPhdWsJAokRIqF4OhD48ad0sOjNaBDE6AUqWjns
         nv9u9kq3xnqD5rZ1yzsRhEUJ7BtzJ/O+IjqUjtHtEQtvLOqjkgqo7063n164tVyTQuoA
         QNHuZXtTcKSnWm3YmzaTBQRnE6lFOM+UQCRG1Wvf/oo7kwwqQ1TOx2MWcy1jxTP+vGMe
         4b9Q==
X-Gm-Message-State: AOAM532C5OZRQkw59QppGBoPcvU+HBCzXaDpqcZ5BE6g8mO7SjOrYOxM
	gix7oXjHGkLyk29w/imIJbQ=
X-Google-Smtp-Source: ABdhPJzrFSwLQXRWHjv+BCuZLtTqIXqJ5O123bm0YP6cVShdBBVwS4EHIPcKh7620CUVy5fYYpdJUA==
X-Received: by 2002:a9d:d45:: with SMTP id 63mr427824oti.238.1619047030401;
        Wed, 21 Apr 2021 16:17:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9sm216588ooq.31.2021.04.21.16.17.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 16:17:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Apr 2021 16:17:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Jiri Kosina <jkosina@suse.cz>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210421231707.GA131841@roeck-us.net>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2104212226420.18270@cbobk.fhfr.pm>
 <a49275f4-ebb9-8a12-1911-cf3114cb35c2@linuxfoundation.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a49275f4-ebb9-8a12-1911-cf3114cb35c2@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Apr 21, 2021 at 04:18:15PM -0600, Shuah Khan wrote:
> On 4/21/21 2:28 PM, Jiri Kosina wrote:
> > On Wed, 21 Apr 2021, Jiri Kosina wrote:
> > 
> > > I am all for discussing policy of trivial patches (*), but just to make it
> > > clear -- I don't think that's really directly related to the University of
> > > Minnesota issue.
> > 
> > (*) saying that as a de-facto maintainer of trivial.git, although that
> >      tree has been severely neglected over the past years. Also, as far as
> >      I can say, none of the umn.edu patches went in through the trivial
> >      tree
> > 
> 
> I agree. I looked at a few including this one:
> 
> 8e949363f017e2011464812a714fb29710fb95b4
> net: mlx5: Add a missing check on idr_find, free buf
> 

Coincidentally that introduced a UAF (or, rather, made an existing UAF
worse) which was later fixed with commit 31634bf5dcc4. Was that one of
the experiments ?

Guenter

> Definitely doesn't fall under trivial category. It is unfortunate
> that we are in the situation to not be able to trust patches as we
> do get fix patches for syzbot bugs from new developers.
> 
> There are no easy solutions other than reviews. Trivial patch focused
> policy will not help address this problem.
> 
> thanks,
> -- Shuah
> 

