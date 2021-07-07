Return-Path: <ksummit+bounces-296-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F93BEB28
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6D6633E1080
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF322F80;
	Wed,  7 Jul 2021 15:44:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9F168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 15:44:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 9AC0B2B00980;
	Wed,  7 Jul 2021 11:44:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 07 Jul 2021 11:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=zHnMP2z+r/Nzd12JU8FofgpOL7L
	/E4Zm49J/UP+WdJ4=; b=KxDxmLPaUGqn1WiGoCDIRa2c/IyxLBrfPi4a8HH+Ory
	Nx+Qz+FVrWlX8TH55CO9CiC0DpyDjhNKW3MO/CtXtndpblGaMdELNPeI6UpX4azw
	E9yu1bHMa11WTnghbdz2drynYJhQ66RHxZjAPTGfdLNejWJblVFdBziSiAxgLvXn
	ALd6UCzwROa+8Mmy3OW20yW5kOQmQEzwlujmPM2DgB4q5H8XKlos/+CvTPksL9fi
	OG0nxfmmdHDe8ts8BNPfALfYiCRLyziadhsM2JTVttgdE8R4NmMzv9GZLY2/kOpp
	RQObkRJh2440zYVUeGM6ltIaaaQ1xsitsPWUg+Vod5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zHnMP2
	z+r/Nzd12JU8FofgpOL7L/E4Zm49J/UP+WdJ4=; b=cxcyDehcMczMKZEF0N/5wj
	bsJ2dkINdJ6FSLsnvEYXT5sjvW9js6LShN8ZuSchu004Lh0TXzdB3V+2uKO9Le/L
	ISWrlLOZY07r8zCK5IVRuYAGZbKgb/tXHKYBQlKWyDB8ajduquO9ktVLT2M86Z1a
	3B6aKC0ptcf4ItSQki378uwLEKjn0HLcgX7ivLP5U1iwT4Yq6MGevooGvw1P+Qo9
	DlCR+FsfWVU5X+ybFL+JOXQGokYpp6XY8eQ03Y39Emcnt/EyJhD5dyXNMPbu8Rfd
	N01seM0ChzgL8J5MdrqBB+4YdycbR95PJ1c4BdMm6rbBEyfChALOlnVOixGsDw8A
	==
X-ME-Sender: <xms:68vlYDcgr9PrNF57C-7PJKwK81ta94e01eIWuJm0hLBMsIuGiFLlLA>
    <xme:68vlYJM9LCUnDEurWAmdMuzeDI3gp__BCfbmUy7QyInRHdOpsRfJTF4VADFegk8u2
    cgAr1MsDZrWMg>
X-ME-Received: <xmr:68vlYMihDMgUghinr_-YrJB35b5fhjnyLxRQBBrvT5zC_XHITFqUsUzoHeD_8dpXlKs5oc8_muK4ZBh4eOS7-ldMFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgedtge
    dtudeuleekgefffefglefguefhgfffgeefudekfeffgfehiedvfeetnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhdprghrtgdrrhhspdhpthhrrdgrshenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
    mh
X-ME-Proxy: <xmx:68vlYE_-_V80mkij_trECUPjfb8Spr7WVfohJqQMRjaxAKQ6DeILfA>
    <xmx:68vlYPsFuEAcUY7dyF7ukG_6dB77h9Ez0KxbgOO7BO32kOuLf5LGtQ>
    <xmx:68vlYDGqBJLceiGd_I0TJ1HM7Z6zAP1-y5X85lX9272wkpG8o-Yj3w>
    <xmx:7MvlYIFt1oVQRBYe294N-tc-WeplIHtMqrhERiYxsf5KqsJ7mW2lgLIFZQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:44:42 -0400 (EDT)
Date: Wed, 7 Jul 2021 17:44:41 +0200
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOXL6Th+pot9+Fp3@kroah.com>
References: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>

On Wed, Jul 07, 2021 at 05:15:01PM +0200, Miguel Ojeda wrote:
> For instance, we have a `Ref` type that is similar to `Arc` but reuses
> the `refcount_t` from C and introduces saturation instead of aborting
> [3]
> 
> [3] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/arc.rs

This is interesting code in that I think you are missing the part where
you still need a lock on the object to prevent one thread from grabbing
a reference while another one is dropping the last reference.  Or am I
missing something?

The code here:

   fn drop(&mut self) {
        // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
        // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
        // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
        // freed/invalid memory as long as it is never dereferenced.
        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();

        // INVARIANT: If the refcount reaches zero, there are no other instances of `Ref`, and
        // this instance is being dropped, so the broken invariant is not observable.
        // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
        let is_zero = unsafe { rust_helper_refcount_dec_and_test(refcount) };
        if is_zero {
            // The count reached zero, we must free the memory.
            //
            // SAFETY: The pointer was initialised from the result of `Box::leak`.
            unsafe { Box::from_raw(self.ptr.as_ptr()) };
        }
   }

Has a lot of interesting comments, and maybe just because I know nothing
about Rust, but why on the first line of the comment is there always
guaranteed a reference to the object at this point in time?  And yes
it's ok to have a pointer to memory that is not dereferenced, but is
that what is happening here?

I feel you are trying to duplicate the logic of a "struct kref" here,
and that requires a lock to work properly.  Where is the lock here?

thanks,

greg k-h

